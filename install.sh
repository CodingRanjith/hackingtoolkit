#!/bin/bash

set -e

clear

BLACK='\e[30m'
RED='\e[31m'
GREEN='\e[92m'
YELLOW='\e[33m'
ORANGE='\e[93m'
BLUE='\e[34m'
PURPLE='\e[35m'
CYAN='\e[36m'
WHITE='\e[37m'
NC='\e[0m'
purpal='\033[35m'

echo -e "${RED} "
echo ""
echo "  ██╗░░██╗░█████╗░░█████╗░██╗░░██╗██╗███╗░░██╗░██████╗░  ████████╗░█████╗░░█████╗░██╗░░░░░██╗░░██╗██╗████████╗   ";
echo "  ██║░░██║██╔══██╗██╔══██╗██║░██╔╝██║████╗░██║██╔════╝░  ╚══██╔══╝██╔══██╗██╔══██╗██║░░░░░██║░██╔╝██║╚══██╔══╝   ";
echo "  ███████║███████║██║░░╚═╝█████═╝░██║██╔██╗██║██║░░██╗░  ░░░██║░░░██║░░██║██║░░██║██║░░░░░█████═╝░██║░░░██║░░░   ";
echo "  ██╔══██║██╔══██║██║░░██╗██╔═██╗░██║██║╚████║██║░░╚██╗  ░░░██║░░░██║░░██║██║░░██║██║░░░░░██╔═██╗░██║░░░██║░░░   ";
echo "  ██║░░██║██║░░██║╚█████╔╝██║░╚██╗██║██║░╚███║╚██████╔╝  ░░░██║░░░╚█████╔╝╚█████╔╝███████╗██║░╚██╗██║░░░██║░░░   ";
echo "  ╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░╚══╝░╚═════╝░  ░░░╚═╝░░░░╚════╝░░╚════╝░╚══════╝╚═╝░░╚═╝╚═╝░░░╚═╝░░░   ";

echo -e "${ORANGE}  [X]  𝗔𝗟𝗟 𝗜𝗡 𝗢𝗡𝗘 𝗛𝗮𝗰𝗸𝗶𝗻𝗴 𝗧𝗼𝗼𝗹 𝗙𝗼𝗿 𝗛𝗮𝗰𝗸𝗲𝗿𝘀 𝗧𝗼𝗼𝗹 𝗖𝗿𝗲𝗮𝘁𝗲𝗱 𝗯𝘆 𝘾𝙤𝙙𝙞𝙣𝙜 𝙍𝙖𝙣𝙟𝙞𝙩𝙝 𝙁𝙧𝙤𝙢 𝙄𝙉𝘿𝙄𝘼 [X]";

echo -e "${BLUE}                                    https://github.com/CodingRanjith/hackingtoolkit ${NC}"
echo -e "${RED}                                     [!] This Tool Must Run As ROOT [!]${NC}\n"
echo -e ${CYAN}                "Select Best Option : \n"
echo -e "${WHITE}              [1] Kali Linux / Parrot-Os (apt)"
echo -e "${WHITE}              [2] Arch Linux (pacman)" # added arch linux support because of feature request #231
echo -e "${WHITE}              [0] Exit "
echo -n -e "CodingRanjith >> "
read choice
INSTALL_DIR="/usr/share/doc/hackingtoolkit"
BIN_DIR="/usr/bin/"
if [ $choice == 1 ] || [ $choice == 2 ]; then
	echo "[*] Checking Internet Connection .."
	wget -q --tries=10 --timeout=20 --spider https://google.com
	if [[ $? == 0 ]]; then
        echo -e ${BLUE}"[✔] Loading ... "
        if [ $choice == 1 ]; then
            sudo apt-get update -y && apt-get upgrade -y
            sudo apt-get install python3-pip -y
        elif [ $choice == 2 ]; then # added arch linux support because of feature request #231
            sudo pacman -Suy
            sudo pacman -S python-pip yay
        fi

	    echo "[✔] Checking directories..."
	    if [ -d "$INSTALL_DIR" ]; then
	        echo "[!] A Directory hackingtoolkit Was Found.. Do You Want To Replace It ? [y/n]:" ;
	        read input
	        if [ "$input" = "y" ]; then
	            sudo rm -R "$INSTALL_DIR"
	        else
	            exit
	        fi
	    fi

        echo "[✔] Installing ...\n";
        sudo git clone https://github.com/CodingRanjith/hackingtoolkit.git "$INSTALL_DIR";
        echo "#!/bin/bash
        python3 $INSTALL_DIR/htk.py" '${1+"$@"}' > htk;
        sudo chmod +x hackingtoolkit;
        sudo cp hackingtoolkit /usr/bin/ && rm hackingtoolkit;

        echo "\n[✔] Trying to installing Requirements ..."
        if [ $choice == 1 ]; then
            sudo pip3 install lolcat boxes flask requests
            sudo apt-get install -y figlet
        elif [ $choice == 2 ]; then # added arch linux support because of feature request #231
            sudo pip3 install lolcat boxes flask requests
            yay -S boxes --noconfirm
            sudo pacman -S figlet
        fi

	else
		  echo -e $RED "Please Check Your Internet Connection ..!!"
	fi

    if [ -d "$INSTALL_DIR" ]; then
        echo "";
        echo "[✔] Successfuly Installed !!! \n\n";
        echo -e $ORANGE "       [+]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++[+]"
        echo            "       [+]                                                             [+]"
        echo -e $ORANGE "       [+]      ✔ Now Just Type In Terminal (hackingtoolkit) ✔        [+]"
        echo            "       [+]                                                             [+]"
        echo -e $ORANGE "       [+]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++[+]"
    else
        echo "[✘] Installation Failed !!! [✘]";
        exit
    fi
elif [ $choice == 0 ] && [ $choice != 1 ] && [ $choice != 2 ]; then # fixed the "./test.sh: line 107: [: asd: integer expression expected" when entering any invalid input containing letters
    echo -e $RED "[✘] THank Y0u !! [✘] "
    exit
else
    echo -e $RED "[!] Select Valid Option [!]"
fi

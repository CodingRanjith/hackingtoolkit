# coding=utf-8
from core import HackingTool
from core import HackingToolsCollection


class WifiJammerNG(HackingTool):
    TITLE = "WifiJammer-NG - Continuously jam all wifi clients and access points within range"
    DESCRIPTION = "Continuously jam all wifi clients and access points within range."
    INSTALL_COMMANDS = [
        "sudo git clone https://github.com/MisterBianco/wifijammer-ng.git",
        "cd wifijammer-ng;sudo pip install -r requirements.txt"
    ]
    RUN_COMMANDS = [
        'echo "python wifijammer.py [-a AP MAC] [-c CHANNEL] [-d] [-i INTERFACE] [-m MAXIMUM] [-k] [-p PACKETS] [-s SKIP] [-t TIME INTERVAL] [-D]"| boxes | lolcat',
        "cd wifijammer-ng;sudo python wifijammer.py"
    ]
    PROJECT_URL = "https://github.com/paragonsean/wifijammer-ng" # https://github.com/2ZZ/wifijammer-ng is no longer available I forked a copy of the orginal from https://github.com/2ZZ/wifijammer-ng


class KawaiiDeauther(HackingTool):
    TITLE = "KawaiiDeauther - Kawaii Deauther is a pentest toolkit whose goal is to perform"
    DESCRIPTION = "Kawaii Deauther is a pentest toolkit whose goal is to perform \n " \
                  "jam on WiFi clients/routers and spam many fake AP for testing purposes."
    INSTALL_COMMANDS = [
        "sudo git clone https://github.com/aryanrtm/KawaiiDeauther.git",
        "cd KawaiiDeauther;sudo bash install.sh"
    ]
    RUN_COMMANDS = ["cd KawaiiDeauther;sudo bash KawaiiDeauther.sh"]
    PROJECT_URL = "https://github.com/aryanrtm/KawaiiDeauther"


class WifiJammingTools(HackingToolsCollection):
    TITLE = "Wifi Deauthenticate"
    TOOLS = [
        WifiJammerNG(),
        KawaiiDeauther()
    ]

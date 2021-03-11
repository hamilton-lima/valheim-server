#!/bin/bash
set -o xtrace

export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export SteamAppId=892970

# display version for log
cat /etc/os-release

# define environment variables based on local.env
export $(cat /home/steam/valheim/variables.env | xargs)

# enable world saving
# chmod -R 755 /home/steam/.config/unity3d/IronGate/Valheim

echo "valheim.service: START $(date "+%Y-%m-%d %H:%M:%S")" 

# Tip: Make a local copy of this script to avoid it being overwritten by steam.
# NOTE: Minimum password length is 5 characters & Password cant be in the server name.
# NOTE: You need to make sure the ports 2456-2458 is being forwarded to your server through your local router & firewall.
/home/steam/valheim/valheim_server.x86_64 -nographics -batchmode \
-port 2456 \
-public 0 \
-name "$NAME" \
-world "$WORLD" \
-password "$PASSWORD" \
-savedir "/home/steam/valheim-data" &

export LD_LIBRARY_PATH=$templdpath
echo "valheim.service: $(date "+%Y-%m-%d %H:%M:%S")" 

# keep the server running
while :
do
echo "valheim.service: $(date "+%Y-%m-%d %H:%M:%S")" 
sleep 60
done


export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export SteamAppId=892970

# define environment variables based on local.env
export $(cat /home/steam/valheim/variables.env | xargs)

# enable world saving
# chmod -R 755 /home/steam/.config/unity3d/IronGate/Valheim

echo "valheim.service: START $(date "+%Y-%m-%d %H:%M:%S")" 

# Tip: Make a local copy of this script to avoid it being overwritten by steam.
# NOTE: Minimum password length is 5 characters & Password cant be in the server name.
# NOTE: You need to make sure the ports 2456-2458 is being forwarded to your server through your local router & firewall.
valheim_server.x86_64 -nographics -batchmode -name "$NAME" -port 2456 -world "$WORLD" -password "$PASSWORD" -public 0 &
export LD_LIBRARY_PATH=$templdpath
echo "valheim.service: $(date "+%Y-%m-%d %H:%M:%S")" 

# keep the server running
while :
do
echo "valheim.service: $(date "+%Y-%m-%d %H:%M:%S")" 
sleep 60
done


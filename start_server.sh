export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export SteamAppId=892970

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
echo "valheim.service: START ${TIMESTAMP}" >> /home/steam/valheim/server.out

# Tip: Make a local copy of this script to avoid it being overwritten by steam.
# NOTE: Minimum password length is 5 characters & Password cant be in the server name.
# NOTE: You need to make sure the ports 2456-2458 is being forwarded to your server through your local router & firewall.
/home/steam/valheim/valheim_server.x86_64  -nographics -batchmode -name "OincLand" -port 2456 -world "OincLand" -password "supersecret21" -public 1 >> /home/steam/valheim/server.out 2>&1 &
export LD_LIBRARY_PATH=$templdpath

# Updated from https://gamesgds.com/valheim-how-to-set-up-dedicated-linux-server/
echo "Server started"
echo ""

while :
do
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
echo "valheim.service: ${TIMESTAMP}" >> /home/steam/valheim/server.out
sleep 60
done
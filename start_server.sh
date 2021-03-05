export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export SteamAppId=892970

echo "Starting Valheim server"

# Tip: Make a local copy of this script to avoid it being overwritten by steam.
# NOTE: Minimum password length is 5 characters & Password cant be in the server name.
# NOTE: You need to make sure the ports 2456-2458 is being forwarded to your server through your local router & firewall.
/home/steam/valheim/valheim_server.x86_64  -nographics -batchmode -name "OincLand" -port 2456 -world "OincLand" -password "supersecret21" -public 0

export LD_LIBRARY_PATH=$templdpath
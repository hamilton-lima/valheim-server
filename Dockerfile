FROM cm2network/steamcmd

RUN echo "valheim custom 0.0.5"

RUN mkdir /home/steam/valheim
RUN /home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steam/valheim +app_update 896660 validate +exit

COPY start_server.sh /home/steam/valheim/
COPY variables.env /home/steam/valheim/

COPY worlds /home/steam/.config/unity3d/IronGate/Valheim/worlds
COPY default-config/* /home/steam/.config/unity3d/IronGate/Valheim

CMD bash /home/steam/valheim/start_server.sh

EXPOSE 2456/udp
EXPOSE 2457/udp

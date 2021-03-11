FROM cm2network/steamcmd

RUN echo "valheim custom 0.0.5"

# Create folders
RUN mkdir /home/steam/valheim

# Install valheim server
RUN /home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steam/valheim +app_update 896660 validate +exit

COPY variables.env /home/steam/valheim/
COPY start_server.sh /home/steam/valheim/

RUN mkdir /home/steam/valheim-data
VOLUME /home/steam/valheim-data

CMD bash /home/steam/valheim/start_server.sh
EXPOSE 2456/udp
EXPOSE 2457/udp

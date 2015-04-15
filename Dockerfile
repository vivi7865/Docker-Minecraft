FROM itzg/ubuntu-openjdk-7

MAINTAINER vivi7865 <me@vivi7865.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y wget libmozjs-24-bin imagemagick && apt-get clean
RUN update-alternatives --install /usr/bin/js js /usr/bin/js24 100

RUN wget -O /usr/bin/jsawk https://github.com/micha/jsawk/raw/master/jsawk
RUN chmod +x /usr/bin/jsawk
RUN useradd -M -s /bin/false minecraft \
  && mkdir /minecraft \
  && chown minecraft:minecraft /minecraft

EXPOSE 25565

ADD start.sh /start
ADD start-minecraft.sh /start-minecraft
RUN chmod +x /start-minecraft
RUN chmod +x /start

#USER minecraft
VOLUME ['/minecraft']
ADD server.properties /tmp/server.properties
WORKDIR /minecraft

CMD [ "/start-minecraft" ]

ENV JVM_OPTS -Xmx2048M -Xms1024M
ENV SERVER_JAR server.jar
ENV SOFTWARE vanilla
ENV DOWNLOAD_URL https://s3.amazonaws.com/Minecraft.Download/versions/1.8.1/minecraft_server.1.8.1.jar

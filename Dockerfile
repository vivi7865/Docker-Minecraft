FROM ubuntu:14.04

MAINTAINER vivi7865 <me@vivi7865.com>

RUN apt-get update && apt-get install -y openjdk-7-jre  && apt-get clean

RUN useradd -m minecraft -u 1000

RUN mkdir /home/minecraft/server/
RUN chown minecraft:minecraft /home/minecraft/server/
ADD entrypoint /usr/sbin/entrypoint
RUN chmod +x /usr/sbin/entrypoint
WORKDIR /home/minecraft/

EXPOSE 25565
USER 1000
ENTRYPOINT entrypoint

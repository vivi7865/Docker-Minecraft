FROM ubuntu:14.04

MAINTAINER vivi7865 <me@vivi7865.com>

RUN apt-get update && apt-get install openjdk7 && apt-get clean

RUN useradd -m minecraft -u 1000

RUN mkdir /home/minecraft/server/
RUN chown minecraft:minecraft /home/minecraft/server/
ADD entrypoint /home/minecraft/entrypoint
RUN chmod +x /home/minecraft/entrypoint
WORKDIR /home/minecraft/

EXPOSE 25565
USER 1000
ENTRYPOINT ./entrypoint

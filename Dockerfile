FROM ubuntu:14.04

MAINTAINER vivi7865 <me@vivi7865.com>

RUN useradd -m minecraft -u 1000

RUN mkdir /home/minecraft/server/
RUN chown minecraft:minecraft /home/minecraft/server/
ADD assets /home/minecraft/assets/
WORKDIR /home/minecraft/

EXPOSE 25565
USER 1000
ENTRYPOINT entrypoint

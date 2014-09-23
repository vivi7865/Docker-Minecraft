FROM ubuntu:14.04

MAINTAINER vivi7865 <me@vivi7865.com>

RUN useradd -m minecraft -u 1000

RUN mkdir /home/minecraft/
RUN chown minecraft:minecraft /home/minecraft/
WORKDIR /home/minecraft/

EXPOSE 25565
USER 1000
ENTRYPOINT entrypoint

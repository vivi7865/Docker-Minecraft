Docker-Minecraft
================
Based on [itzg's docker minecraft](https://github.com/itzg/dockerfiles/tree/master/minecraft-server)

[Github](https://github.com/vivi7865/Docker-Minecraft)

[Docker registry](https://registry.hub.docker.com/u/vivi7865/docker-minecraft/)

The simplest way to start with Docker-Minecraft is with:

    docker run -e EULA=true -p 25565:25565 vivi7865/docker-minecraft
You must agree with the minecraft EULA for running a minecraft server. More information [here][1].
Minecraft run on port 25565 but you can set it to port 80 for example like this:

    docker run -e EULA=true -p 80:25565 vivi7865/docker-minecraft

If you want to be able to stop your server from the console your can add `-it` in the docker run command: 

    docker run -e EULA=true -p 25565:25565 -it vivi7865/docker-minecraft

To run your minecraft server in background add `-d`: 

    docker run -e EULA=true -p 25565:25565 -d vivi7865/docker-minecraft

To run an another minecraft server version by setting the `DOWNLOAD_URL` to the server jar. (ie `-e DOWNLOAD_URL=http://your.domain.com/spigot.jar`)

In order to readily access the Minecraft datas, use `-v`: `-v /path/on/host:/minecraft`

  [1]: https://account.mojang.com/documents/minecraft_eula

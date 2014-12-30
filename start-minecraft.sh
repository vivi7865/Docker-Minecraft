#!/bin/sh
cd /minecraft

if [ ! -e $SERVER_JAR ]; then
  echo "Downloading $SOFTWARE ..."
  wget -O "$SERVER_JAR" -q "$DOWNLOAD_URL"
fi

if [ ! -e server.properties ]; then
  cp /tmp/server.properties .
fi

if [ -n "$MOTD" ]; then
  sed -i "/motd\s*=/ c motd=$MOTD" /minecraft/server.properties
fi

if [ -n "$WORLD" ]; then
  sed -i "/level-name\s*=/ c level-name=$WORLD" /minecraft/server.properties
fi

if [ ! -e /minecraft/eula.txt ]; then
  if [ "$EULA" != "" ]; then
    echo "# Generated via Docker on $(date)" > eula.txt
    echo "eula=$EULA" >> eula.txt
  else
    echo ""
    echo "Please accept the Minecraft EULA at"
    echo "  https://account.mojang.com/documents/minecraft_eula"
    echo "by adding the following immediately after 'docker run':"
    echo "  -e EULA=TRUE"
    echo ""
    exit 1
  fi
fi

java $JVM_OPTS -jar $SERVER_JAR

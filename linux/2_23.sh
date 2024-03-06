#!/bin/bash

if [ -z "$1" ]
then
    exit 1
fi

NAME="$1"

# DIR="$(pwd)"

BIN="/usr/bin"
LIB="/usr/lib"
ETC="/etc"

DIR="$HOME/Desktop"
if [ -n "$SUDO_USER" ]
then
        DIR="/home/$SUDO_USER/Desktop"
fi

if [ -z "$DIR/$NAME" ]
then
    echo "Program not found."
    exit 1
fi

sudo cp "$DIR/$NAME" "$BIN" && sudo chmod u+x "$BIN/$NAME"

sudo mkdir "$LIB/Yazykovskaya"
sudo cp "$DIR/$NAME.lib" "$LIB/Yazykovskaya"

sudo mkdir "$ETC/Yazykovskaya"
sudo cp "$DIR/$NAME.conf" "$ETC/Yazykovskaya"

sudo bash -c "echo "$BIN/$NAME" > "$ETC/Yazykovskaya/$NAME.conf""
sudo bash -c "echo "$LIB/Yazykovskaya/$NAME.lib" >> "$ETC/Yazykovskaya/$NAME.conf""

echo "Enter the name of wanted program: "
read NAME

sudo bash -c 'find /var/log -type f -exec grep -l "$1" {} \; > /var/log/Yazykovskaya.log' bash "$NAME"
cat /var/log/Yazykovskaya.log

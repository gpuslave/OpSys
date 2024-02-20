#!/bin/bash

# Check if directory has been provided
if [ -z "$1" ]
then
    echo "Please provide a directory."
    exit 1
fi

# Set the directory
DIR=$1

touch "$DIR"/someFile.run
touch "$DIR"/anotherFile.run

mkdir "$DIR"/subdir 2>/dev/null

touch "$DIR"/subdir/oneMore.run

# Find all .run files in the directory and its subdirectories
# and set the executable attribute
find "$DIR" -type f -name "*.run" -exec chmod +x {} \;
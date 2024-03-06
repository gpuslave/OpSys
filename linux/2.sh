#!/bin/bash

DIR="$HOME"

for dir in $(find "$DIR" -type d -name ".*");
do
        echo $dir
done
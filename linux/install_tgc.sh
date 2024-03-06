#!/bin/bash

# sudo groupadd tgc
# sudo useradd -m -G tgc gpuslave
# sudo chgrp tgc ~/OP/tgc
# sudo chmod g+x ~/OP/tgc

# Get the directory of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Create a file in the script's directory
touch "$DIR/filename"

chmod u+x ~/OP/tgc
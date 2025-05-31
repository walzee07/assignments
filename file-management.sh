#!/bin/bash
# Create a project directory and set up structure and permissions

# Create main project directory one after the other
mkdir -p project/{src,bin,logs,docs}

# Navigate into the src directory
cd project/src

# Create files
touch main.sh utils.sh config.sh

# Move main.sh to ../bin 
mv main.sh ../bin/

# Set permissions: user = rwx, group/others = none on logs directory
chmod 700 ../logs

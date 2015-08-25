#!/bin/sh

red='\033[0;31m'
green='\033[0;32m'
info='\033[0;36m'
NC='\033[0m' # No Color

if [ -z "$1" ]; then echo "${red}Please, set container name${NC}";exit 1; else
    sudo docker exec -it runner_$1_1 bash
fi

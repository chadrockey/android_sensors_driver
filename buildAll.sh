#!/bin/bash

PROJECT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
KEY=${PROJECT_PATH}/keys/key.jks


if [ ! -f ${KEY} ]; then 
    ./createKey.sh key
fi

./build.sh key

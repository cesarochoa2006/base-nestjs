#!bin/bash
export NODE_PROJECT_CURRENT_VERSION=`npm run version --silent`
docker build . -t base:$NODE_PROJECT_CURRENT_VERSION
echo "Build and load done"
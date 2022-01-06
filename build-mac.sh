#!bin/bash
echo "Warning :: build with multi platform support, may need external dependencies"
export NODE_PROJECT_CURRENT_VERSION=`npm run version --silent`
docker buildx build . -t base:$NODE_PROJECT_CURRENT_VERSION --load 
echo "Build and load done"
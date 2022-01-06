#!bin/bash
echo "Warning :: build with multi platform support, may need external dependencies"
docker buildx build . -t base --load 
echo "Build and load done"
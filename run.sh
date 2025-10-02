#!/bin/bash

IMAGE_NAME="doker-test"
CONTAINER_NAME="doker-test"

# 既存のコンテナがあれば削除
if [ "$(docker ps -ap -f name=$CONTAINER_NAME)" ]; then
  docker rm -f $CONTAINER_NAME
fi

# ビルド
docker build -t $IMAGE_NAME .
# コンテナを起動
docker run -d --name $CONTAINER_NAME -p 8080:3000 $IMAGE_NAME

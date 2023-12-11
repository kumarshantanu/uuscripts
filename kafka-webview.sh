#!/usr/bin/env bash

# Source
# https://hub.docker.com/r/sourcelaborg/kafka-webview

echo "Point your browser at http://localhost:8080 and login using admin@example.com with password admin"

docker run -it -p 8080:8080 -v kafkawebview_data:/app/data sourcelaborg/kafka-webview:latest


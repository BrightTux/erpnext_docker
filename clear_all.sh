#!/bin/bash

docker compose down
docker stop frappe_docker-redis-cache-1
docker stop frappe_docker-redis-queue-1
docker stop frappe_docker-db-1
docker rm frappe_docker-redis-cache-1
docker rm frappe_docker-redis-queue-1
docker rm frappe_docker-db-1
docker ps -a --filter "name=frappe" --format "{{.ID}}" | xargs -r docker rm -f
docker images --filter "reference=frappe*" --format "{{.ID}}" | xargs -r docker rmi -f
docker volume ls --filter "name=frappe" --format "{{.Name}}" | xargs -r docker volume rm

#!/bin/sh
docker-compose stop && docker-compose rm -f && docker system prune -f

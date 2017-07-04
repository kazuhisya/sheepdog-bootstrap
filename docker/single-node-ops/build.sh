#!/bin/sh
time docker build -t local/sheep .
docker run -itd --name sheep local/sheep
sleep 10
docker exec -it sheep dog cluster format
echo "-------------------- login to container --------------------"
docker exec -it sheep bash

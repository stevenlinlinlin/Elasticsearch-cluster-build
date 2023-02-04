#!/bin/bash
# Ubuntu 22.04
# Use docker to build kibana

# Step 1: docker install
sudo apt install docker.io

# Step 2: docker pull kibana image
sudo docker pull kibana:7.10.1

# Step 3: docker run kibana image
sudo docker run -it -d --name kibana.local -p 5601:5601 -v /etc/kibana:/usr/share/kibana/config kibana:7.10.1

#!/bin/bash
# Ubuntu 22.04
masterIP=$1
node1IP=$2

# Step 1: Update the system
sudo apt update

# Step 2: Install elasticsearch-7.10.2 
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.10.2-linux-x86_64.tar.gz
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.10.2-linux-x86_64.tar.gz.sha512
shasum -a 512 -c elasticsearch-7.10.2-linux-x86_64.tar.gz.sha512 
tar -xzf elasticsearch-7.10.2-linux-x86_64.tar.gz
cd elasticsearch-7.10.2/

# Step 3: set elasticsearch.yml config
sed -i s'/#cluster.name: my-application/cluster.name: es-cluster/g' config/elasticsearch.yml
sed -i s'/#node.name: node-1/node.name: elastic-master/g' config/elasticsearch.yml
sed -i s'/#network.host: 192.168.0.1/network.host: 0.0.0.0/g' config/elasticsearch.yml
sed -i s'/#http.port: 9200/http.port: 9200/g' config/elasticsearch.yml
sed -i s'/#discovery.seed_hosts: \["host1", "host2"\]/discovery.seed_hosts: \["$masterIP", "$node1IP"\]/g' config/elasticsearch.yml
sed -i s'/#cluster.initial_master_nodes: \["node-1", "node-2"\]/cluster.initial_master_nodes: \["elastic-master", "elastic-node1"\]/g' config/elasticsearch.yml

# Step 4: max virtual memory areas change
sudo sysctl -w vm.max_map_count=262144

# Step 5: Start elasticsearch in background
./bin/elasticsearch -d -p pid
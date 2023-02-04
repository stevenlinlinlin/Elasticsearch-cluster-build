# elasitic-cluster-build
Create 3 server with Ubuntu 22.04 LINUX  
elastic install tutorial: https://www.elastic.co/guide/en/elasticsearch/reference/7.10/targz.html#targz

## elastic master for one server
### Build and start:
```bash
bash elastic_master.sh [master server IP] [node1 server IP]
```
for example:
```bash
source elastic_master.sh 192.168.1.102 192.168.1.121
```
* To shut down Elasticsearch, kill the process ID recorded in the pid file:
    ```
    pkill -F pid
    ```
### Testing elasticsearch
```bash
curl -X GET "http://[masterIP]:9200"
```
* check the elastic search success!

## elastic node1 for other server
### Build and start:
```bash
source elastic_node1.sh [master server IP] [node1 server IP]
```
* To shut down Elasticsearch, kill the process ID recorded in the pid file:
    ```
    pkill -F pid
    ```

### Testing elasticsearch
```bash
curl -X GET "http://[node1IP]:9200/_cluster/health"
```
* check the cluster status: "number_of_nodes":2

## kibana build for the other server
1. create kibana folder in etc
```
sudo mkdir /etc/kibana
```

2. send kibana.yml to this server:/etc/kibana
```
scp kibana.yml [user]@[serverIP]:/etc/kibana
```

3. Use docker to build kibana
```bash
bash kibana.sh
```

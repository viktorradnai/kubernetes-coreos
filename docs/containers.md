# Kubernetes Docker Containers

## Build the Binaries

Built the binaires using docker. The resulting image exports a data volume containing the apiserver, kubecfg, proxy, kubelet, and controller-manager binaries under /kubernetes.

```
git clone https://github.com/kelseyhightower/kubernetes-coreos.git
cd kubernetes-coreos
docker build -t kelseyhightower/kubernetes-binaries:latest docker/build
```

### Copy the Binaries

Run a named container and copy the binaries using the docker cp command.

```
docker run --name kubernetes-binaries kelseyhightower/kubernetes-binaries:latest /bin/sh
docker cp kubernetes-binaries:/kubernetes/ .
```

At this point the binaries should be uploaded to a central storage location.

## Build the Docker Containers

Build a Docker container for each Kubernetes binary. The dockerfiles used in this step pull binaries from Google Cloud Storage.

```
for i in apiserver controller-manager kubecfg kubelet proxy
  do docker build -t kelseyhightower/kubernetes-${i} docker/${i}
done
```

## Run the Containers

### kelseyhightower/kubernetes-apiserver 

```
docker run -d --net=host kelseyhightower/kubernetes-apiserver \
--address 0.0.0.0 \
--etcd_servers http://127.0.0.1:4001 \
--machines "127.0.0.1"
```

### kelseyhightower/kubernetes-kubelet
```
docker run -d -v /var/run/docker.sock:/var/run/docker.sock --net=host \
kelseyhightower/kubernetes-kubelet \
--address=0.0.0.0 \
--port 10250 \
--etcd_servers http://127.0.0.1:4001 \
--hostname_override="127.0.0.1"
```

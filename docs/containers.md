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

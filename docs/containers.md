# Build

## Build Kubernetes
 
```
docker build -t kelseyhightower/kubernetes-binaries:latest docker/build
```

## Copy Binaries

```
docker run --name kubernetes-binaries kelseyhightower/kubernetes-binaries:latest /bin/sh
docker cp kubernetes-binaries:/kubernetes/ .
```

-

```
$ tree kubernetes/
kubernetes/
├── apiserver
├── controller-manager
├── integration
├── kubecfg
├── kubelet
├── proxy
└── src
    └── github.com
        └── GoogleCloudPlatform
            └── kubernetes -> /$GOPATH/src/github.com/GoogleCloudPlatform/kubernetes

3 directories, 7 files
```

## Build Kubernetes Docker Containers

```
for i in apiserver controller-manager kubecfg kubelet proxy
  do docker build -t kelseyhightower/kubernetes-${i} docker/${i}
done
```

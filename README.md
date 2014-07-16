# Kubernetes CoreOS

This how-to guide demostrates how to run [Google Kubernetes](https://github.com/GoogleCloudPlatform/kubernetes) on [CoreOS](https://coreos.com)

- [Quick Start](#quick-start)
- [Building Kubernetes Binaries](docs/build.md)

## Quick Start

### Install Linux binaries

```
sudo mkdir -p /opt/kubernetes/bin
cd /opt/kubernetes
sudo wget https://github.com/kelseyhightower/kubernetes-coreos/releases/download/v0.0.2/kubernetes-coreos.tar.gz
sudo tar -xvf kubernetes-coreos.tar.gz -C /opt/kubernetes/bin
```

### Add the Kubernetes systemd units

```
cd $HOME
git clone https://github.com/kelseyhightower/kubernetes-coreos.git
sudo cp kubernetes-coreos/units/* /etc/systemd/system/
```

### Start the Kubernetes services

```
sudo systemctl start kubernetes-apiserver
sudo systemctl start kubernetes-controller-manager
sudo systemctl start kubernetes-kubelet
sudo systemctl start kubernetes-proxy
```

### Run the Redis pod

```
/opt/kubernetes/bin/kubecfg -c kubernetes-coreos/pods/redis.json create /pods
```

#### List running pods

```
/opt/kubernetes/bin/kubecfg list /pods
```

#### Test the redis server

```
docker run -t -i dockerfile/redis /usr/local/bin/redis-cli -h 172.17.42.1
```

> 172.17.42.1 is the docker gateway

### Delete the pod

```
/opt/kubernetes/bin/kubecfg delete /pods/redis
```

# Installation Guide

The recommended way to run Kubernetes on CoreOS is to use [Cloud-Config](https://coreos.com/docs/cluster-management/setup/cloudinit-cloud-config/).

## Setup

### Standalone

The standalone cloud-config file can be used to setup a single node Kubernetes cluster.

* standalone.yml

### Cluster

The following cloud-config files can be used to setup a three node Kubernetes cluster.

* master.yml
* node1.yml
* node2.yml

### Creating config-drives

```
mkdir -p /tmp/new-drive/openstack/latest/
```
```
cd configs
```
```
for i in standalone master node1 node2; do
  cp configs/${i}.yml /tmp/new-drive/openstack/latest/user_data
  mkisofs -R -V config-2 -o ~/iso/${i}.iso /tmp/new-drive
done
```

## Remote Access

Setup a SSH tunnel to the Kubernetes API Server.

```
sudo ssh -f -nNT -L 8080:127.0.0.1:8080 core@${APISERVER}
```

Download a kubecfg client

**Darwin**

```
wget http://storage.googleapis.com/kubernetes/darwin/kubecfg -O /usr/local/bin/kubecfg
```

**Linux**

```
wget http://storage.googleapis.com/kubernetes/kubecfg -O /usr/local/bin/kubecfg
```

Issue commands remotely using the kubecfg command line tool.

```
kubecfg list /pods
```

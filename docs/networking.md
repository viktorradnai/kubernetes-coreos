# Networking

### Create cbr0 bridge

```
brctl addbr cbr0
ip link set dev cbr0 mtu 1460
ip addr add 10.244.1.1 dev cbr0
ip link set dev cbr0 up
```

### Configure iptables

```
/sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE \! -d 10.0.0.0/8
```


### Configure docker

```
DOCKER_OPTS="--bridge cbr0 --iptables=false"
```



# Kubernetes: kubecfg
#

FROM google/debian:wheezy
MAINTAINER Kelsey Hightower <kelsey.hightower@gmail.com>

RUN apt-get update -y && apt-get install --no-install-recommends -y -q curl ca-certificates
RUN curl -o /usr/local/bin/kubecfg http://storage.googleapis.com/kubernetes/kubecfg
RUN chmod +x /usr/local/bin/kubecfg
ENTRYPOINT ["/usr/local/bin/kubecfg"]

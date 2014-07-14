# Kubernetes: controller-manager
#

FROM google/debian:wheezy
MAINTAINER Kelsey Hightower <kelsey.hightower@gmail.com>

RUN apt-get update -y && apt-get install --no-install-recommends -y -q curl ca-certificates
RUN curl -o /usr/local/bin/controller-manager http://storage.googleapis.com/kubernetes/controller-manager
RUN chmod +x /usr/local/bin/controller-manager

ENTRYPOINT ["/usr/local/bin/controller-manager", "-logtostderr=true"]

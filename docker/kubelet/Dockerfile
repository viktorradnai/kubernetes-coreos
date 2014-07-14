# Kubernetes API Server
#

FROM google/debian:wheezy
MAINTAINER Kelsey Hightower <kelsey.hightower@gmail.com>
EXPOSE 10250 

RUN apt-get update -y && apt-get install --no-install-recommends -y -q curl ca-certificates
RUN curl -o /usr/local/bin/kubelet http://storage.googleapis.com/kubernetes/kubelet
RUN chmod +x /usr/local/bin/kubelet

ENTRYPOINT ["/usr/local/bin/kubelet", "-logtostderr=true"]

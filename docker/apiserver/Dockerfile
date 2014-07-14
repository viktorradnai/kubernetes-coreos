# Kubernetes: apiserver
#

FROM google/debian:wheezy
MAINTAINER Kelsey Hightower <kelsey.hightower@gmail.com>

RUN apt-get update -y && apt-get install --no-install-recommends -y -q curl ca-certificates
RUN curl -o /usr/local/bin/apiserver http://storage.googleapis.com/kubernetes/apiserver
RUN chmod +x /usr/local/bin/apiserver
ENTRYPOINT ["/usr/local/bin/apiserver"]

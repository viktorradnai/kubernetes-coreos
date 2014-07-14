# Kubernetes: proxy
#

FROM google/debian:wheezy
MAINTAINER Kelsey Hightower <kelsey.hightower@gmail.com>

RUN apt-get update -y && apt-get install --no-install-recommends -y -q curl ca-certificates
RUN curl -o /usr/local/bin/proxy http://storage.googleapis.com/kubernetes/proxy
RUN chmod +x /usr/local/bin/proxy
ENTRYPOINT ["/usr/local/bin/proxy"]

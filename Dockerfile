# Kubernetes: build
#

FROM google/debian:wheezy
MAINTAINER Kelsey Hightower <kelsey.hightower@gmail.com>

RUN apt-get update -y && apt-get install --no-install-recommends -y -q curl build-essential ca-certificates git mercurial bzr
RUN mkdir /goroot && curl https://storage.googleapis.com/golang/go1.3.linux-amd64.tar.gz | tar xvzf - -C /goroot --strip-components=1
RUN mkdir /gopath

ENV GOROOT /goroot
ENV GOPATH /gopath
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin

RUN mkdir -p /kubernetes/
RUN mkdir -p $GOPATH/src/github.com/GoogleCloudPlatform
WORKDIR $GOPATH/src/github.com/GoogleCloudPlatform
RUN git clone https://github.com/GoogleCloudPlatform/kubernetes.git
RUN cd kubernetes && hack/build-go.sh
RUN mv kubernetes/output/go/* /kubernetes/
VOLUME /kubernetes

FROM rhel7

MAINTAINER Avesh Agarwal <avagarwa@redhat.com>

ENV container docker

RUN yum -y update && \
    yum -y --enablerepo rhel-7-server-extras-rpms install etcd && \
    yum clean all

LABEL Version=1.0
LABEL Vendor="Red Hat"

LABEL INSTALL="docker run --rm --privileged -v /:/host -e HOST=/host -e IMAGE=IMAGE -e NAME=NAME IMAGE /usr/bin/install.sh"
LABEL UNINSTALL="docker run --rm --privileged -v /:/host -e HOST=/host -e IMAGE=IMAGE -e NAME=NAME IMAGE /usr/bin/uninstall.sh"
LABEL RUN="docker run -d -p 4001:4001 -p 7001:7001 -p 2379:2379 -p 2380:2380  IMAGE"

ADD root /

EXPOSE 4001 7001 2379 2380

CMD ["/usr/bin/etcd"]

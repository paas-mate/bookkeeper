FROM ttbb/base:jdk17

ARG version=4.15.0

RUN wget https://downloads.apache.org/bookkeeper/bookkeeper-$version/bookkeeper-server-$version-bin.tar.gz  && \
mkdir -p /opt/sh/bookkeeper && \
tar -xf bookkeeper-server-$version-bin.tar.gz -C /opt/sh/bookkeeper --strip-components 1 && \
ln -s /opt/sh/bookkeeper/bin/bookkeeper /usr/bin/bookkeeper && \
ln -s /opt/sh/bookkeeper/bin/bkctl /usr/bin/bkctl && \
rm -rf bookkeeper-server-$version-bin.tar.gz

ENV BOOKKEEPER_HOME /opt/sh/bookkeeper

WORKDIR /opt/sh/bookkeeper
USER root

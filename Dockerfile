FROM shoothzj/base:jdk17

ARG version=4.15.1

RUN wget https://downloads.apache.org/bookkeeper/bookkeeper-$version/bookkeeper-server-$version-bin.tar.gz  && \
mkdir -p /opt/bookkeeper && \
tar -xf bookkeeper-server-$version-bin.tar.gz -C /opt/bookkeeper --strip-components 1 && \
ln -s /opt/bookkeeper/bin/bookkeeper /usr/bin/bookkeeper && \
ln -s /opt/bookkeeper/bin/bkctl /usr/bin/bkctl && \
rm -rf bookkeeper-server-$version-bin.tar.gz

ENV BOOKKEEPER_HOME /opt/bookkeeper

WORKDIR /opt/bookkeeper
USER root

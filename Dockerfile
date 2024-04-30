FROM shoothzj/compile:jdk21-mvn-jni AS compiler

RUN git clone --depth 1 https://github.com/apache/bookkeeper.git && \
    cd bookkeeper && \
    mvn -B clean package -DskipTests=true && \
    mkdir -p /opt/bookkeeper && \
    tar -xf /bookkeeper/bookkeeper-dist/all/target/bookkeeper-all-4.18.0-SNAPSHOT-bin.tar.gz -C /opt/bookkeeper --strip-components 1

FROM shoothzj/base:jdk21

COPY --from=compiler /opt/bookkeeper /opt/bookkeeper

RUN ln -s /opt/bookkeeper/bin/bookkeeper /usr/bin/bookkeeper && \
    ln -s /opt/bookkeeper/bin/bkctl /usr/bin/bkctl

COPY --chmod=0755 entrypoint.sh /opt/bookkeeper/entrypoint.sh

ENV BOOKKEEPER_HOME /opt/bookkeeper

WORKDIR /opt/bookkeeper

ENTRYPOINT [ "/opt/bookkeeper/entrypoint.sh" ]

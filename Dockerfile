FROM ubuntu:16.04

RUN apt-get update && \
    apt-get -y install openjdk-8-jdk curl && \
    rm -rf /var/lib/apt/lists/*

ENV MAVEN_HOME /usr/share/maven

RUN curl -fsSL http://archive.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz | tar xzf - -C /usr/share && \
    mv /usr/share/apache-maven-3.6.3 /usr/share/maven && \
    ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

WORKDIR /apps

CMD /bin/bash

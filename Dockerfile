FROM ubuntu
MAINTAINER Brendan Lawlor <brendan@sanuasoft.com>

RUN apt-get -qq update
RUN apt-get install -y git curl
RUN apt-get install -y openjdk-7-jdk
RUN curl -o /tmp/scala-2.11.1.tgz http://www.scala-lang.org/files/archive/scala-2.11.1.tgz
RUN tar xzf /tmp/scala-2.11.1.tgz -C /usr/share/
RUN ln -s /usr/share/scala-2.11.1 /usr/share/scala
RUN for i in scala scalc fsc scaladoc scalap; do ln -s /usr/share/scala/bin/${i} /usr/bin/${i}; done
RUN curl -o /tmp/sbt.deb  http://scalasbt.artifactoryonline.com/scalasbt/sbt-native-packages/org/scala-sbt/sbt/0.13.1/sbt.deb
RUN dpkg -i /tmp/sbt.deb
VOLUME /code
WORKDIR /code
EXPOSE 8080
RUN sbt --version
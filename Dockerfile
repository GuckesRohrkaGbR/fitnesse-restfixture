FROM openjdk:8-jdk-alpine
MAINTAINER Christopher Guckes <christopher.guckes@torq-dev.de>

RUN mkdir -p /opt/fitnesse
ADD . /opt/fitnesse
RUN chmod o+x /opt/fitnesse/start.sh
RUN chmod o+x /opt/fitnesse/mvnw

VOLUME /opt/fitnesse/src/main/resources
VOLUME /opt/fitnesse/src/test/java
WORKDIR /opt/fitnesse

RUN ./mvnw clean install

ENTRYPOINT ["/opt/fitnesse/start.sh"]
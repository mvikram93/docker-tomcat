FROM alpine:3.7

MAINTAINER Vikram M

RUN apk add --no-cache openjdk8
#RUN apk add chmod

ENV TOMCAT_MAJOR=8 \
    TOMCAT_VERSION=8.5.3 \
    TOMCAT_HOME=/opt/tomcat \
    CATALINA_HOME=/opt/tomcat \
    CATALINA_OUT=/dev/null

RUN apk add --no-cache bash

ENV JAVA_HOME /opt/jdk

ENV PATH ${PATH}:${JAVA_HOME}/bin

RUN mkdir /opt
ENV HOME /home/default
RUN apk upgrade --update && \
    apk add --update curl && \
    curl -jksSL -o /tmp/apache-tomcat.tar.gz http://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    gunzip /tmp/apache-tomcat.tar.gz && \
    tar -C /opt -xf /tmp/apache-tomcat.tar && \
    ln -s /opt/apache-tomcat-${TOMCAT_VERSION} ${TOMCAT_HOME} && \
    rm -rf ${TOMCAT_HOME}/webapps/* && \
    apk del curl && \
    rm -rf /tmp/* /var/cache/apk/*

ENV PATH /opt/tomcat/bin/

COPY sample.war /opt/tomcat/webapps

#RUN chown +x /opt/tomcat/bin

#EXPOSE 8044
#CMD ["catalina.sh", "run"]
FROM ubuntu:18.04

MAINTAINER Vikram M

RUN  apt-get update 
RUN  apt-get -y upgrade 
RUN	 apt -y install apt-transport-https ca-certificates curl software-properties-common 
RUN	 add-apt-repository ppa:webupd8team/java 
RUN	 apt update 
RUN	 apt-get install -y openjdk-8-jdk

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME
ENV PATH ${PATH}:${JAVA_HOME}/bin

RUN apt-get install -y wget 
RUN	wget http://www-eu.apache.org/dist/tomcat/tomcat-9/v9.0.24/bin/apache-tomcat-9.0.24.tar.gz -P /tmp
RUN mkdir /opt/tomcat

ENV CATALINA_HOME /opt/tomcat/apache-tomcat-9.0.24
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME


RUN tar xf /tmp/apache-tomcat-9*.tar.gz -C /opt/tomcat
RUN chmod +x $CATALINA_HOME/bin/*.sh
COPY sample.war $CATALINA_HOME/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]

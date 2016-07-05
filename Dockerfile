#
# Base Image for Open DevOps Pipeline
#
FROM centos
MAINTAINER Open DevOps Team <open.devops@gmail.com>

ENV JAVA_VERSION 8u92
ENV BUILD_VERSION b14

# Upgrading system && Install Java
RUN yum -y upgrade \
    && yum -y install wget \
    && wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$BUILD_VERSION/jdk-$JAVA_VERSION-linux-x64.rpm" -O /tmp/jdk-8-linux-x64.rpm \
    && yum -y install /tmp/jdk-8-linux-x64.rpm \
    && rm -rf /tmp/jdk-8-linux-x64.rpm \
    && rm -rf /var/cache/yum/* \
    && yum clean all \
    && alternatives --install /usr/bin/java jar /usr/java/latest/bin/java 200000 \
    && alternatives --install /usr/bin/javaws javaws /usr/java/latest/bin/javaws 200000 \
    && alternatives --install /usr/bin/javac javac /usr/java/latest/bin/javac 200000

# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/java/latest

# Define default command.
CMD ["bash"]

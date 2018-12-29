FROM centos:6.6
MAINTAINER Rojay_Ren <rojay.ren@gmail.com>

ENV TZ "Asia/Shanghai"


############# install require package #############
RUN yum update -y && yum install -y openssh-server vim freetype && yum clean all
RUN ln -s /mnt/homework/ /home/ && useradd -d /home/homework -M homework && echo 'odp' | passwd --stdin homework
    &&  ln -s /mnt/homework/php/bin/php /usr/local/bin/php


#ENTRYPOINT ["/etc/init.d/sshd","start"]
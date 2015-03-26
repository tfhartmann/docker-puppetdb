# Install PuppetDB Server
FROM centos:centos7
MAINTAINER Tim Hartmann <tfhartmann@gmail.com>

RUN yum install epel-release -y && \
    yum install http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm -y && \
    yum install -y puppet

# Expose PuppetDB ports
#EXPOSE 8140

# Run PuppetDB
#CMD [ "/usr/bin/puppetserver", "foreground" ]


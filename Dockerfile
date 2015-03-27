# Install PuppetDB Server
FROM centos:centos7
MAINTAINER Tim Hartmann <tfhartmann@gmail.com>

RUN yum install epel-release -y && \
    yum install http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm -y
RUN yum install -y puppet \
    tar \
    python-pip

RUN puppet module install puppetlabs-puppetdb

# Expose PuppetDB ports
#EXPOSE 8140

# Run PuppetDB
#CMD [ "/usr/bin/puppetserver", "foreground" ]


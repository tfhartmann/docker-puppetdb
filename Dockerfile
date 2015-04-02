# Install PuppetDB Server
FROM centos:centos6
MAINTAINER Tim Hartmann <tfhartmann@gmail.com>

RUN yum install epel-release -y && \
    yum install http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm -y
RUN yum install -y puppet \
    puppetdb \
    tar \
    hostname \
    python-pip

# This is a total hack to install the puppetdb package dependencies
# and allows the the puppetlabs/puppetdb module in the start_puppetdb.sh
# script to correctly configure ssl. Mostly just a time saver, otherwise
# on startup the module installs the puppetdb package as well as the
# dependencies.
RUN yum remove puppetdb -y 
RUN puppet module install puppetlabs-puppetdb
RUN curl http://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem -o /etc/pki/ca-trust/source/anchors/rds-combined-ca-bundle.pem && \
    update-ca-trust

ADD scripts/start_puppetdb.sh /tmp/start_puppetdb.sh
# Run PuppetDB
CMD [ "/tmp/start_puppetdb.sh" ]

# Expose PuppetDB ports
EXPOSE 8080
EXPOSE 8081


#!/bin/bash

: ${DBHOST:=puppetdbopen.cpmpxebkd7tp.us-east-1.rds.amazonaws.com}
#: ${DBHOST:=$PUPPET_PORT_8140_TCP_ADDR}
: ${DBUSER:=puppetdb}
: ${DBPASS:=puppetdb}
# SSL Doesn't actually work yet
: ${SSL:=true}

echo DBHOST=${DBHOST:? postgres server address is mandatory, fallback is a linked containers exposed 8140}

### `JAVA_ARGS`
### `NODE_TTL`
### NODE_PURGE_TTL

# database_host =>
# database_username
# database_password
# database_ssl
# java_args => 
# node_ttl
# node_purge_ttl

yum makecache fast
# Configure Puppet Certs
echo "Puppet First run to request cert"
puppet agent --test
echo "Puppet Second run - nuke it from orbit just to be sure..."
puppet agent --test

# Install and Configure PuppetDB
# pre-installing the rpm before the first puppet run throws a wedge into ssl setup.

puppet apply -e 'class { "puppetdb::server": database_host => "'${DBHOST}'", database_username => "'${DBUSER}'", database_password => "'${DBPASS}'", puppetdb_service_status => stopped, listen_address => "0.0.0.0", ssl_listen_address => "0.0.0.0" }' --verbose

# run that beautiful bean footage
puppetdb foreground -d

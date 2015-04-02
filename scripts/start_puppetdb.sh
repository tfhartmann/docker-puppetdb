#!/bin/bash

echo "Puppet First run to request cert"
puppet agent --test
echo "Puppet Second run - nuke it from orbit just to be sure..."
puppet agent --test

puppet apply -e 'class { "puppetdb::server": database_host => "puppetdbopen.cpmpxebkd7tp.us-east-1.rds.amazonaws.com", puppetdb_service_status => stopped, listen_address => "0.0.0.0", ssl_listen_address => "0.0.0.0" }' --verbose

puppetdb foreground -d

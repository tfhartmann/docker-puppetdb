#!/bin/bash

echo "Creating Cert"
puppet agent --test
echo "Apply Manifest"
puppet agent --test

puppet apply -e 'class { "puppetdb::server": database_host => "puppetdbopen.cpmpxebkd7tp.us-east-1.rds.amazonaws.com", puppetdb_service_status => stopped, ssl_listen_address => "0.0.0.0" }' --verbose

puppetdb foreground -d

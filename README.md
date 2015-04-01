# PuppetDB and PuppetBoard

Run a PuppetDB Server with PuppetBoard installed for reporting
##  environment variables 
### Stuff

## Examples

puppet apply -e 'class { "puppetdb::server": database_host => "puppetdb-postgres", puppetdb_service_status => stopped }' --verbose
puppet apply -e 'class { "puppetdb::server": database_host => "puppetdbopen.cpmpxebkd7tp.us-east-1.rds.amazonaws.com", puppetdb_service_status => stopped }' --verbose

puppet apply -e 'class { "puppetdb::server": database_host => "puppetdbopen.cpmpxebkd7tp.us-east-1.rds.amazonaws.com", puppetdb_service_status => stopped, ssl_listen_address => "0.0.0.0" }' --verbose


Requirements 

Puppet Master
docker run -it -d -h puppet --name puppet -h puppet tfhartmann/puppetserver

Run PuppetDB

docker run --link puppet:puppet  -it --rm b58f95712466

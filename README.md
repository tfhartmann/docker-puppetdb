# PuppetDB and PuppetBoard

Run a PuppetDB Server with PuppetBoard installed for reporting
##  environment variables 
### Stuff

## Examples

puppet apply -e 'class { "puppetdb::server": database_host => "puppetdb-postgres", puppetdb_service_status => stopped }' --verbose

# xen VM hosted at gandi.net (95.142.173.157) - backup & IPv6 gateway
node 'backup' inherits 'base-node' {

  include c2corg::backup::server
  include c2corg::webserver::ipv6gw
  include c2corg::collectd::client

}
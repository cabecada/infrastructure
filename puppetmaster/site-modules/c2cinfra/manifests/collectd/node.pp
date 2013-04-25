class c2cinfra::collectd::node {

  include collectd
  include haproxy::collectd::typesdb

  $collectd_host = hiera('collectd_host')

  collectd::config::global {
    'FQDNLookup': value => 'false';
  }

  if $::lsbdistcodename == 'squeeze' {
    apt::preferences { 'collectd_from_bpo':
      package  => 'collectd collectd-core collectd-dbg collectd-dev collectd-utils libcollectdclient-dev libcollectdclient0',
      pin      => "release a=${::lsbdistcodename}-backports",
      priority => '1010',
    }
  }

  collectd::plugin { [
    'contextswitch',
    'exec',
    'interface',
    'load',
    'memory',
    'processes',
    'tcpconns',
    'users',
    'vmem']: }

  collectd::config::plugin { 'setup network plugin':
    plugin   => 'network',
    settings => inline_template('
Server     "<%= collectd_host %>"
CacheFlush 86400
'),
  }

  package { 'udev': } # else collectd installation fails on VZs.

}

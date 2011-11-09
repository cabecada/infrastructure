class c2corg::collectd::client {
  include collectd

  collectd::conf {
    'FQDNLookup':
      value => 'false';
    'TypesDB':
      value => '/usr/share/collectd/types.db', quote => true;
    'LoadPlugin':
      value => $operatingsystem ? {
        'GNU/kFreeBSD' => ['interface', 'load', 'memory', 'users'],
        default        => ['interface', 'load', 'memory', 'processes', 'tcpconns', 'users', 'vmem']
      };
  }

  collectd::rrdtool { 'rrd': }

  if $datacenter =~ /c2corg|epnet/ {
    collectd::network { 'network':
      server      => '192.168.191.126',
      cache_flush => 86400,
    }
  }

  collectd::syslog { 'info': }

  if $lsbdistcodename == 'lenny' {
    apt::preferences { ['collectd', 'collectd-utils']:
      pin      => 'release a=lenny-backports',
      priority => '1010',
    }
  }

  if $operatingsystem != 'GNU/kFreeBSD' {
    package { 'udev': } # else collectd installation fails on VZs.
  }

}
class c2corg::varnish::instance {

  include varnish

  Varnish::Instance {
    varnishlog => false,
  }

  $symfony_master_host   = hiera('symfony_master_host')
  $symfony_failover_host = hiera('symfony_failover_host')
  $c2cstats_host         = hiera('c2cstats_host')
  $metac2c_host          = hiera('metac2c_host')
  $metaskirando_host     = hiera('metaskirando_host')
  $v4redirections_host   = hiera('v4redirections_host')

  case $::hostname {
    rproxy: {
      varnish::instance { $::hostname:
        vcl_content => template('c2corg/varnish/c2corg.vcl.erb'),
        storage     => ["file,/var/lib/varnish/${::hostname}/varnish_storage.bin,32G"],
        params      => ['ban_lurker_sleep=3',
                        'ping_interval=6',
                        'thread_pool_min=15'],
      }
    }

    pre-prod: {
      varnish::instance { $::hostname:
        address     => ['*:8080'],
        vcl_content => template('c2corg/varnish/c2corg.vcl.erb'),
        storage     => ["file,/var/lib/varnish/${::hostname}/varnish_storage.bin,512M"],
      }
    }

    test-marc: {
      varnish::instance { $::hostname:
        vcl_content => template('c2corg/varnish/c2corg.vcl.erb'),
        storage     => ["file,/var/lib/varnish/${::hostname}/varnish_storage.bin,512M"],
      }
    }
  }

  if $::lsbdistcodename == 'squeeze' {
    apt::preferences { "varnish_from_bpo":
      package  => "varnish libvarnishapi1",
      pin      => "release a=${::lsbdistcodename}-backports",
      priority => "1010",
    }
  }

}

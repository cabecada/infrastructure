class c2cinfra::rabbitmq {

  $mco_user = hiera('mco_user')

  apt::pin { 'rabbitmq_from_c2corg_repo':
    packages => 'rabbitmq-server',
    label    => 'C2corg',
    release  => "${::lsbdistcodename}",
    priority => '1010',
  }

  class { "rabbitmq::server":
    delete_guest_user => true,
  }

  rabbitmq_user { $mco_user:
    ensure   => present,
    admin    => false,
    password => hiera('mco_pass'),
  }

  rabbitmq_user_permissions { "${mco_user}@/":
    ensure               => present,
    configure_permission => "^amq.gen-.*",
    write_permission     => "^amq.(gen-.*|topic)",
    read_permission      => "^amq.(gen-.*|topic)",
  }

  rabbitmq_plugin { "rabbitmq_stomp":
    ensure => present,
    notify => Class["rabbitmq::service"],
  }

}

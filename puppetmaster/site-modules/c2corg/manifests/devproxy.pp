class c2corg::devproxy {

  nginx::site { 'devproxy':
    source => 'puppet:///c2corg/nginx/devproxy.conf',
  }

  $resolvers = hiera('resolvers')

  nginx::conf { 'resolver':
    content => inline_template('# file managed by puppet
resolver <%= resolvers.join(" ") %>;
'),
  }

  @@nat::fwd { 'forward http port':
    host  => '103',
    from  => '80',
    to    => '80',
    proto => 'tcp',
    tag   => 'portfwd',
  }

  @@nat::fwd { 'forward https port':
    host  => '103',
    from  => '443',
    to    => '443',
    proto => 'tcp',
    tag   => 'portfwd',
  }

}

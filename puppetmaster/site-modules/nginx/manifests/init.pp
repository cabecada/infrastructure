class nginx ($package='nginx-full') {

  if $::lsbdistcodename == 'squeeze' {
    apt::pin { 'nginx_from_bpo':
      packages => 'nginx nginx-full nginx-extras nginx-common nginx-light nginx-naxsi',
      release  => "${::lsbdistcodename}-backports",
      priority => '1010',
    }
  }

  package { $package:
    ensure => present,
    alias  => 'nginx',
  } ->
  service { 'nginx':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }

  exec { 'reload-nginx':
    command     => '/etc/init.d/nginx reload',
    refreshonly => true,
  }

  ::nginx::conf { 'force-tls':
    content => 'ssl_protocols TLSv1 TLSv1.1 TLSv1.2;',
  }

}

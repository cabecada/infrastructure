import 'nodes/*.pp'

filebucket { 'main': server => $puppet_server }

Exec { path => '/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/bin:/usr/local/sbin' }

File {
  backup => main,
  owner  => root,
  group  => root,
  mode   => 0644,
}

Exec['apt_update'] -> Package <| tag != 'virtualresource' |>
Package['sudo'] -> Sudoers <| |>

Apt::Source {
  include_src => false,
}

Sudoers {
  hosts   => $::hostname,
  target  => '/etc/sudoers',
}

Apache::Vhost {
  user  => 'root',
  group => 'root',
  mode  => '0755',
}

Apache::Vhost::Ssl {
  user  => 'root',
  group => 'root',
  mode  => '0755',
}

Service {
  provider => $::lsbdistcodename ? {
    'jessie' => 'systemd',
    default  => undef,
  }
}

# purge unmanaged users.
resources { 'user':
  purge              => true,
  unless_system_user => '999',
}

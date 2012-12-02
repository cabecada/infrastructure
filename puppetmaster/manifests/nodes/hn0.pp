# ProLiant DL360 G4p
node 'hn0' inherits 'base-node' {

  include c2cinfra::hn::hn0

  include vz
  include c2cinfra::containers

  include c2corg::prod::fs::openvz

  include c2cinfra::collectd::node

  fact::register {
    'role': value => ['HN openvz', 'routeur'];
    'duty': value => 'prod';
  }

  c2corg::backup::dir { "/etc/vz/conf/": }
}

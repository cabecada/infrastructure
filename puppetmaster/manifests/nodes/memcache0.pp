# VM
node 'memcache0' inherits 'base-node' {

  class {'memcached':
    max_memory => 2048,
  }

  include c2cinfra::collectd::node

  fact::register {
    'role': value => 'instance memcached';
    'duty': value => 'prod';
  }
}
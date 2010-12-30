node 'base-node' {

  include apt
  include puppet::client
  include c2corg::account
  include c2corg::mta
  include "c2corg::apt::$lsbdistcodename"
  include c2corg::common::packages
  include c2corg::common::services
  include c2corg::common::config

}

node 'pm' inherits 'base-node' {

  include puppet::server
  include c2corg::collectd::client

  c2corg::backup::dir {
    ["/srv/puppetmaster", "/var/lib/puppet/ssl", "/home"]:
  }

  realize C2corg::Account::User[marc]
}

node 'lists' inherits 'base-node' {

}

node 'pkg' inherits 'base-node' {

  include c2corg::reprepro

  c2corg::backup::dir { "/srv/deb-repo/": }

}

node 'monit' inherits 'base-node' {

  include c2corg::collectd::server

  c2corg::backup::dir { "/srv/collectd": }

}

# ProLiant DL360 G4p - debian/squeeze
node 'hn0' inherits 'base-node' {

  include c2corg::hn::hn0

  include vz
  include c2corg::vz

  include c2corg::collectd::client
  # c2corg::backup::dir { "/var/lib/vz/template/cache/": }
}

# ProLiant DL360 G4 - debian/kFreeBSD
node 'hn1' inherits 'base-node' {

  include c2corg::hn::hn1

  include puppet::devel
  include varnish

  varnish::instance { $hostname:
    vcl_file   => "puppet:///c2corg/ha/c2corg.vcl",
    storage    => "malloc,7400M",
    varnishlog => false,
  }

  include c2corg::collectd::client
}

# PowerEdge 2950 - debian/lenny
node 'hn2' inherits 'base-node' {

  include c2corg::hn::hn2

  include haproxy

  #include c2corg::collectd::client # warning: don't break existing collectd installation !!
}

node 'pre-prod' inherits 'base-node' {

  include c2corg::database::prod

  include c2corg::webserver::symfony
  include c2corg::webserver::carto
  include c2corg::webserver::svg

  apache::vhost { "camptocamp.org":
    aliases => ["www.camptocamp.org", "www-preprod.camptocamp.org"],
    docroot => "/srv/www/camptocamp.org/web",
    cgibin  => false,
  }

  apache::auth::htpasswd { "c2corg@camptocamp.org":
    vhost    => "camptocamp.org",
    username => "c2corg",
    cryptPassword => "UxYkCOe3sNVJc",
  }

  apache::auth::basic::file::user { "prevent-robots-from-indexing":
    vhost => "camptocamp.org",
  }

  augeas { "temporarily disable php-xcache admin auth":
    changes => "set /files/etc/php5/conf.d/xcache.ini/xcache.admin/xcache.admin.enable_auth Off",
  }

  c2corg::account::user { "alex@root": user => "alex", account => "root" }
  c2corg::account::user { "gottferdom@root": user => "gottferdom", account => "root" }
  c2corg::account::user { "xbrrr@root": user => "xbrrr", account => "root" }
  c2corg::account::user { "gerbaux@root": user => "gerbaux", account => "root" }

  include c2corg::collectd::client
}

node 'test-marc' inherits 'base-node' {

}

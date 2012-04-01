class c2corg::mcollective::client {

  include c2corg::mcollective
  include c2corg::password

  package { "mcollective-client":
    ensure => present,
    before => File["/etc/mcollective/client.cfg"],
  }

  file { "/etc/mcollective/client.cfg":
    mode    => 0644,
    content => "# file managed by puppet
topicprefix = /topic/
main_collective = mcollective
collectives = mcollective
libdir = /usr/share/mcollective/plugins
logger_type = syslog
logfile = /dev/null
loglevel = info

# Plugins
securityprovider = psk
plugin.psk = ${c2corg::password::mco_psk}

connector = stomp
plugin.stomp.host = localhost
plugin.stomp.port = 61613
plugin.stomp.user = ${c2corg::password::mco_user}
plugin.stomp.password = ${c2corg::password::mco_pass}
",
  }

}
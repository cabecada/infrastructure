class graphite {

  if (versioncmp($::operatingsystemrelease, 7) >= 0) {

    if ($::lsbdistcodename == 'wheezy') {
      apt::preferences { 'backport graphite-web':
        package  => 'graphite-web',
        pin      => 'release l=C2corg, a=wheezy',
        priority => '1100',
      }
    }

    package { ['python-whisper', 'graphite-carbon', 'graphite-web']:
      ensure => present
    }

  } else {

    vcsrepo { "/usr/src/graphite":
      ensure   => present,
      provider => "bzr",
      source   => "lp:graphite",
    }

    package { [
        "python-cairo",
        "python-django",
        "python-django-tagging",
        "python-memcache",
        "python-zope.interface",
        "python-whisper",
        "python-twisted-core",
      ]:
      ensure => present,
      before => Vcsrepo["/usr/src/graphite"],
    }
  }

}

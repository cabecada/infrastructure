define c2cinfra::account::user ($ensure=present, $user, $account, $groups=[]) {

  if !defined(User[$account]) {
    user { $account:
      ensure => $ensure,
      shell  => "/bin/bash",
      managehome => true,
      groups => $groups,
    }
  }

  case $user {
    "marc": {
      c2cinfra::ssh::userkey { "$name on $account":
        account => $account,
        user    => $user,
        type    => "rsa",
        key     => "AAAAB3NzaC1yc2EAAAABIwAAAQEAuzVRsZMCL1CHqcB5tBVATgRucCaMVpQz5qKO8RAlSwpRod8DYBBMxWpolclxyX+9qHXLiwIWv/Ourld/HrLdbHOpiQ/QAZzZoEOrIQ+hT/iRnlA4Pdub7Ep2Y2AO3eGH8kJn8vl8tkAiey577dfmhYo9LTJQD6csyLEmmnoef/Rn9qWXrUTLF5/1sobtuQ1jkB1qUSG0yjrRTuyLh9/pv6xJgTpQNP5x9ok7MsRrPaZZ5Oyzt0JRNsKY5LpgNForXCm5gsGk+qfoET8zUZ8YUEue8h7zE5WShZNhAnN43EaxxGoBkqQDcnSygJVetfRlwt9JHt4xPrdFJDulvCun+w==",
        require => User[$account],
      }
    }

    "alex": {
      c2cinfra::ssh::userkey { "$name on $account":
        account => $account,
        user    => $user,
        type    => "rsa",
        key     => "AAAAB3NzaC1yc2EAAAADAQABAAACAQDPuy8DB/1Qu7bpWwFnOzhcFDbHCqS4+lMWh1szlZQPi7PL7lU3T09F9yHLg8F7CbkZ1jCpenOJ+t1xjZQAGHLsPrp5SUA0aKBY1D0gef2VNVoSLgzkSSjGtbeJ0xlb4HgUBbkplbm63NmJEqvLvLBZ6Uw94ztsZiMMF2N2fP3D/zIywuOcKMtKeYFmRvbZSkxlh3xLPq1Mlgn2lk4cUQIlghiwx98ymuqiBfA8kY4/sd7Xum0lSDM2aSVXbQ3qQ3uIGOgb8oIkNQvI+wRxUgE5RYUOUdm8UMfvWLjSdu5zu5n3Dw0PXbsEsbTuOZ1t8T1wCbxblZDWC/DiMxSSTzO34JLDiv6Knd8qfdLe6IsW7jri/m3CZ5cQKmOZv8xlEOUywd0dOhVeKyEsjMyGtr6CjnsnMyB2QUVtmiFk3tJkCs355zx7YYRf7ARhIH9TA0/4a2KbOQy94NMEVXNE6gBCZ9E52toBhcEeTGt4ctRhI0d6fQoAb/ZFOtRT0gO9EfEhsQq+dIQIF2QyH8iiHVRNeAq6P83Pj9qXgIMrl691uTHArI2KNZS8CseQXyjEqthospDQ5DByFAE1OhydWdA8LFeBSPOprPr2e75PGSzxkWf8sRKv4+7cMPCrGWGGaYV/fVOIeJrHQs6hphJdQ4TWKRfBcqjJPOpH5WILLVqYCw==",
        require => User[$account],
      }
    }

    "gottferdom": {
      c2cinfra::ssh::userkey { "$name on $account":
        account => $account,
        user    => $user,
        type    => "rsa",
        key     => "AAAAB3NzaC1yc2EAAAADAQABAAABAQD5F/UJcHVtw4iMaXkfeLMTfwUBXvFC+OP1ge2JdL/dxb1pi8U9MTvN8oq3Ze4zlj9JCsklUCVSVWtDRHxDqJrT0aK1j/czyXge1qQ6NN3I2jQeqABobck5O/FVkNDH/mWnwwpMZ4lrzp/fyP1Iml3uhAyUP4a8tX6XkQtFKOVvqdRzMLdRb2ZthzZbzVQeSDnJw+8x9ViDS6JuW95vVFCh/+UPwTwMe1DYm7tMknGAA0NJzRyaga+dpiKk370NfltnVrelqx5BKz/DCVH9PDTRChRW2IJmhUa3ALdp9Cdux+swO27xIbC/oRCfs8s11Zqatrz+TiNEAQBbuuuQ37FB",
        require => User[$account],
      }
    }

    "xbrrr": {
      c2cinfra::ssh::userkey { "$name on $account":
        account => $account,
        user    => $user,
        type    => "dss",
        key     => "AAAAB3NzaC1kc3MAAACBAPU0k5Lg0KFgzjkiAZEoYEGS4bYf9ASoE4D3ffuafBCdD/90jKxu4H10lveEOJSKGMYOtmgU3+bzywTd/p2n6UwczjLPJ4Dy6x1f7Byd/onC77/kAWiztRPY778er0NdslnFA9anKwPSuqoCv9WVYhdEh2Cq2dCFGvesxeesataXAAAAFQC2WR4aRdlit5kU/12jXeVxhrESXwAAAIEA8Eu2i0S20um6Otx4Yo5WThHG82LTrnL7HjscWVEKGL3ICqyqt6StT4nT8TrOS7xHGXPgUpLXTkI4zThM0rhTBOlRPszsbS8nl8CtU5wtIUoP0W2bbPWdLokPI80lLC1Dc77BydJD1kXVQlwoeYgOR4UILlZPb988J4Q1ON9TQT0AAACAcFvlhAD82Eer5SuWYefgaSay2M+/BqyEE2hWgt3eBv8xeU/5vI6NqvXJG0OGCPZQ6YLVbZlvdh86YkrvE6HjqgrG2kFUUokG8vy3iYrRLeJUGJ5JnB8EHUCLsfwZNU4x6+YY34Nnv9npd3zDDSjiwHxx/gfqr8uCQNlZCmmhEk8=",
        require => User[$account],
      }
    }

    "gerbaux": {
      c2cinfra::ssh::userkey { "$name on $account":
        account => $account,
        user    => $user,
        type    => "dss",
        key     => "AAAAB3NzaC1kc3MAAACBAJW+dnvqotAaaWmF72JDDLccYPK6NIRNK9m7hCPOa1iYXronIV3YPw0wlx7HOJkHuiVinD7GwlUM3iIyXUvAbWjiRVfUD/r7kIXZxTaNpT+YM+tPB9q2o33LMtgHb9iNLwiKsLycrbCZ0Wp3R9v714c5GqV1JcG6/lRoYJ3KwNKdAAAAFQCs6gw1fNQudexweUGmXJJBiydxIwAAAIAB4Zn9A/jT3ZpNShkX/nNp7yXVr6Nftv1iopMMsfWzyxnu8EDdtmACLaTuRp/PBHi6sEAQHn0b9f6yVzD4lE4yOIl3wYPjeeQz3zoYdYoBoqh4RsTZbb7Wh1M4zH7PK1UqyS6r7q2gtmr/jKdINh1PTBxY+K8ni0vSPd2Tk2hLawAAAIAfIPCFfEuXgGbeq7EPapUc6D5jPzaKBIQIto3d5AdaV3mxPyboDteQ+UP57t5+8TQv1cb3J8+J9v+SVYP4y+zQru091dXcLqMgHrU7Cbc+frpIkiAQTorW3GFvlZrXgt0YtT0XuJd3Ak6V+HvTR4ANtFPMF20I0itkBEl81HnOCQ==",
        require => User[$account],
      }
    }

    "jose": {
      c2cinfra::ssh::userkey { "$name on $account":
        account => $account,
        user    => $user,
        type    => "rsa",
        key     => "AAAAB3NzaC1yc2EAAAABJQAAAIBduuUshyg6t8vBXxvz+/fHiKQX/IBfRSwIPKoh+c5xEMMujz3p2deUZ0+qDE9yfFpkYx+I3oAtC/dKQmEOdahCd/IoddJqdN0Df4GGgh501MnWggT2NvadXXsl94BUM0TfgNMyQ+sk8YQocLFuK51A2qff3MpIdJJuq9ujspJXLQ==",
        require => User[$account],
      }
    }

    "bubu": {
      c2cinfra::ssh::userkey { "$name on $account":
        account => $account,
        user    => $user,
        type    => "TODO",
        key     => "TODO",
        require => User[$account],
      }
    }

    "saimon": {
      c2cinfra::ssh::userkey { "$name on $account":
        account => $account,
        user    => $user,
        type    => "rsa",
        key     => "AAAAB3NzaC1yc2EAAAABIwAAAQEAo3jxCbExq7zhlFswHyIynochZglSjSSDVrnYzU//y78pzaSwHGlkufwXfU2nEFLdzcziaBp7jiSaqWe00GUhBVZcOYZyvmMneldFDrQlDtrm1aRKf3j/I6pno49Gz727+/8UQCqZv1/BE72WmjjpRwfrjqUVQkRj1UMf41kG1H1Mn2Sx4+faWrbWKWeZG+wnyJACtl0VUwU6iXCsICqPnsSFe+1ZdopQLjRA8aMkmmwfI2MaVHzkX4qgVBd4MQVR1lp11OBnCd6SysNnJYpram3ZRaJY1gLOI3UnHWUWi0RCfS1jdglXLTlgLcz9nZQQVwtH4i+l351skc/UExHiRQ==",
        require => User[$account],
      }
    }

    "stef74": {
      c2cinfra::ssh::userkey { "$name on $account":
        account => $account,
        user    => $user,
        type    => "rsa",
        key     => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCbVv+Igm4+p4PlVak4Qu0agfh91NytfWrbQnxprtEy0xHBHLhYysMr29+bLdwViLU9pIO9cuDhdr5bjLvlEDQ8gl8ZILnaBPwO/OX/xaXY1Otgh5IIxpwOXkLhsEWYUUwr6V7ekLLChDusBMRRr5MXcuBC2RolprNoibzVc+KRGlfa5z9/4lyP4uFX5qrPCSuqZIR1m0OLUwPPRuKONdnKIg+i+Okem+LwZV2vnM5lPHp0qoTZ/1ZfYuev/tadtNyfMJlIZfNHbE73coGZqKf07qI57ADkAX5IFqWn1R7bBC4llKuj8r+BtzSN7xEg5Fnl8q6C1cB0TKUdsqOjjzxb",
        require => User[$account],
      }
    }

    "amorvan": {
      c2cinfra::ssh::userkey { "$name on $account":
        account => $account,
        user    => $user,
        type    => "rsa",
        key     => "AAAAB3NzaC1yc2EAAAABJQAAAQEAix6R8LKvwGjjsv5WAlx70em0d6xK2uMfItPXvsEkkCMVaTFnvdFC34ySQ/IB9WAcJ71fjwK0RNloUgWJn1Z0Ew3UigXwM1uL/lAVpM9Z9PktVglXrKU2nL2X44H6Rjirwd8svsJjlu9LuwK63X1wk1iPXHy8jSOeTsiZv37m8wT6YANeO3gCYn9wT+lJTCKKcKLrsFcIx9YUWsGjg9xUNWa7AYO/0dBPpA3+/EOhPt7Bc/XKUeX7fXHnM8fzIVak/xXPQ+0DFbVH37tYGVsibqqDKvOfK3qq91TgbQDES9WLXmc+zYrCWp3EbngOnKsEQ1aMr+vme3PDRIIUT+5Q2Q==",
        require => User[$account],
      }
    }

    "tsauerwein": {
      c2cinfra::ssh::userkey { "$name on $account":
        account => $account,
        user    => $user,
        type    => "rsa",
        key     => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDz3sh3miHkWttWH3oHxKx4Psf8VKwUDbUC6vvMysz89rizhwgOJrH434gnxZn7jpu9hMgv4A0eGnZ+eZbHlYHxyM2f6R99sH7+RQpYoLuQltVXF3eY8+R+8KgR0pdMRTqgeMeyuOl8ZMFqLszl3j6zyxrrCatobt/lJnLTyhoIY4nG9HzO6rCrt5EaxlkIlLYUcEmXcFaYveyQG8h1q5MjU/BGYZf7j5j5Jmkap/1gd/BuL2dR7xZPqpuTMxF/dvgwCMao8DGKCreNwyEpAuzEgqJpY+k663/DPqKtoQ8nlDmbQTGBTocA1tHp9IVfEgmfjc9ogNlS9VOsrN+0aSIF",
        require => User[$account],
      }
    }

    # the key is vagrant's official unsecure key:
    # https://github.com/mitchellh/vagrant/blob/master/keys/vagrant.pub
    "vagrant": {
      c2cinfra::ssh::userkey { "$name on $account":
        account => $account,
        user    => $user,
        type    => "rsa",
        key     => "AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ==",
        require => User[$account],
      }
    }

    "c2corg": {
      # no one should login directly to this account, but anyone should be
      # able to "sudo -iu" to it.
      sudoers { 'do as c2corg':
        users => '%adm',
        type  => "user_spec",
        commands => [ '(c2corg) ALL' ],
      }
    }

  }
}


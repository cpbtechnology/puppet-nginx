# Class: nginx::package
#
# This module manages NGINX package installation
#
# Parameters:
#
# There are no default parameters for this class.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# This class file is not called directly
class nginx::package (
  $version = 'present'
){
  anchor { 'nginx::package::begin': }
  anchor { 'nginx::package::end': }

  case $::operatingsystem {
    centos,fedora,rhel,redhat,scientific: {
      class { 'nginx::package::redhat':
        version => $version,
        require => Anchor['nginx::package::begin'],
        before  => Anchor['nginx::package::end'],
      }
    }
    amazon: {
      class { 'nginx::package::amazon':
        version => $version,
        require => Anchor['nginx::package::begin'],
        before  => Anchor['nginx::package::end'],
      }
    }
    debian,ubuntu: {
      class { 'nginx::package::debian':
        version => $version,
        require => Anchor['nginx::package::begin'],
        before  => Anchor['nginx::package::end'],
      }
    }
    opensuse,suse: {
      class { 'nginx::package::suse':
        version => $version,
        require => Anchor['nginx::package::begin'],
        before  => Anchor['nginx::package::end'],
      }
    }
  }
}

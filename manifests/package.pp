#
# == Class: ntp::package
#
# The ntp::package class takes care of installing the ntp package as needed
#
# === Parameters
#
#   The defaults are fetched via hiera from ntp::data.
#   They can also be set in any other hiera data file.
#
# [*package_name*]
#   This parameter specifies the name of the package to install.
#
# === Variables
#
# No variables are used in the ntp base class
#
# === Examples
#
#  class { 'ntp::package': }
#
# === Authors
#
# Stefan Goethals <stefan.goethals@super-visions.com>
#
# === Copyright
#
# Copyright 2012 Super-Visions, unless otherwise noted.
#
class ntp::package( $package_name = hiera('ntp_package') )
{
  package { $package_name:
    ensure => installed,
  }
}

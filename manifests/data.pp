#
# == Class: ntp::data
#
# The ntp::data class holds the defaults for all 
# variables and parameters used in the ntp class.
#
# === Parameters
#
# This class does not take parameters.
#
# === Variables
#
# [*ntp_package*]
#   Default ntp package name.
#
# [*ntp_service*]
#   Default ntp service name.
#
# [*ntp_config_dir*]
#   Default ntp config dir.
#
# [*ntp_user*]
#   Default ntp user name.
#
# [*ntp_group*]
#   Default ntp group name.
#
# === Examples
#
#  class { 'ntp::data': }
#
# === Authors
#
# Stefan Goethals <stefan.goethals@super-visions.com>
#
# === Copyright
#
# Copyright 2012 Super-Visions, unless otherwise noted.
#
class ntp::data {
  case $::operatingsystem
  {
    ubuntu, debian: {
      $ntp_package    = 'ntp'
      $ntp_service    = 'ntp'
      $ntp_config_dir = '/etc'
      $ntp_user       = 'root'
      $ntp_group      = 'root'
    }
    centos, redhat: {
      $ntp_package    = 'ntp'
      $ntp_service    = 'ntpd'
      $ntp_config_dir = '/etc'
      $ntp_user       = 'root'
      $ntp_group      = 'root'
    }
    default:
    {
      fail("Unknown OS: $::operatingsystem")
    }
  }
}

#
# == Class: ntp::service
#
# The ntp::service starts, stops or restarts the ntp service as needed.
#
# === Parameters
#
#   The defaults are fetched via hiera from ntp::data.
#   They can also be set in any other hiera data file.
#
# [*ntp_service*]
#   The service name to use.
#
# === Variables
#
# No variables are used in the ntp base class
#
# === Examples
#
#  class { 'ntp::service': }
#
# === Authors
#
# Stefan Goethals <stefan.goethals@super-visions.com>
#
# === Copyright
#
# Copyright 2012 Super-Visions, unless otherwise noted.
#
class ntp::service( $ntp_service = hiera('ntp_service') )
{
  service { $ntp_service:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}

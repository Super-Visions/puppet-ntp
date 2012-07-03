#
# == Class: ntp
#
# The ntp class manges the ntp.conf file based on data stored in hiera
#
# === Parameters
#
# This class does not take parameters as all parameters are fetched via hiera
# The parameter defaults are stored in the ntp::data class
#
# === Variables
#
# No variables are used in the ntp base class
#
# === Examples
#
#  class { ntp: }
#
# === Authors
#
# Stefan Goethals <stefan.goethals@super-visions.com>
#
# === Copyright
#
# Copyright 2012 Super-Visions, unless otherwise noted.
#
class ntp
{
  anchor { 'ntp::start': }->
  class { 'ntp::package': }->
  class { 'ntp::config': }~>
  class { 'ntp::service': }->
  anchor { 'ntp::end': }
}

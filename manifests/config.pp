#
# == Class: ntp::config
#
# The ntp::config class takes care of creating the ntp.conf file 
# and putting it in the correct place on the filesystem
#
# === Parameters
#
#   The defaults are fetched via hiera from ntp::data.
#   They can also be set in any other hiera data file.
#
# [*ntp_user*]
#   The user that must be owner of the file.
#
# [*ntp_group*]
#   The group that must be owner of the file.
#
# [*ntp_config_dir*]
#   The directory that must contain the file.
#
# [*ntp_servers*]
#   List of ntp servers.
#
# [*ntp_options*]
#   Options string to append to each server line.
#
# [*ntp_extra_opts*]
#   Extra options to add at the end of the file.
#
# === Variables
#
# No variables are used in the ntp base class
#
# === Examples
#
#  class { 'ntp::config': }
#
# === Authors
#
# Stefan Goethals <stefan.goethals@super-visions.com>
#
# === Copyright
#
# Copyright 2012 Super-Visions, unless otherwise noted.
#
class ntp::config(
  $ntp_user       => hiera('ntp_user'),
  $ntp_group      => hiera('ntp_group'),
  $ntp_config_dir => hiera('ntp_config_dir'),
  $ntp_servers    => hiera('ntp_servers', ['0.pool.ntp.org', '1.pool.ntp.org']),
  $ntp_options    => hiera('ntp_options', 'UNDEFINED'),
  $ntp_extra_opts => hiera('ntp_extra_opts', 'UNDEFINED')
) 
{
  file { "${ntp_config_dir}/ntp.conf":
    ensure  => present,
    content => template("${module_name}/ntp.conf.erb"),
    owner   => $ntp_user,
    group   => $ntp_group,
    mode    => '0644',
  }
}

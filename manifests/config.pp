
class ntp::config
{
    $ntp_user       = hiera('ntp_user')
    $ntp_group      = hiera('ntp_group')
    $ntp_config_dir = hiera('ntp_config_dir')
    $ntp_servers    = hiera( 'ntp_servers',['0.pool.ntp.org', '1.pool.ntp.org'])
    $ntp_options    = hiera( 'ntp_options', 'UNDEFINED' )
    $ntp_extra_opts = hiera( 'ntp_extra_opts', 'UNDEFINED')

    file { "${ntp_config_dir}/ntp.conf":
        ensure  => present,
        content => template("${module_name}/ntp.conf.erb"),
        owner   => $ntp_user,
        group   => $ntp_group,
        mode    => '0644',
    }
}

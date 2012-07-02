
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

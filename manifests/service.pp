
class ntp::service
{
    $ntp_service = hiera('ntp_service')

    service { $ntp_service:
        ensure     => running,
        enable     => true,
        hasstatus  => true,
        hasrestart => true,
    }
}

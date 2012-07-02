
class ntp::package
{
    $package_name = hiera('ntp_package')

    package { $package_name:
        ensure => installed,
    }
}

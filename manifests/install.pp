# Install class
class s3cmd::install (){

    if ( $::osfamily == 'redhat' ) {
        file {'/etc/yum.repos.d/s3tools.repo':
            source => 'puppet:///modules/s3cmd/etc/yum.repos.d/s3tools.repo',
        }
    $s3cmd_require = File['/etc/yum.repos.d/s3tools.repo']
    } else {
        $s3cmd_require = undef
    }
    package {'s3cmd':
        ensure  => installed,
        require => $s3cmd_require,
    }
}

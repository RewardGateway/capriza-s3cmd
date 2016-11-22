# Install class
class s3cmd::install (
    $s3cmd_version,
    $s3cmd_provider,
    ){
    if $::osfamily == 'redhat' {
        file {'/etc/yum.repos.d/s3tools.repo':
            source => 'puppet:///modules/s3cmd/etc/yum.repos.d/s3tools.repo',
        }
        $s3cmd_require = File['/etc/yum.repos.d/s3tools.repo']
    } else {
        $s3cmd_require = undef
    }
    package { 's3cmd' :
        ensure   => $s3cmd_version,
        provider => $s3cmd_provider,
    }
}

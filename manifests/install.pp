# Install class
class s3cmd::install (){
    $s3cmd_version = '1.6.1'
    exec { 'Uninstall s3cmd apt version' :
        command => '/usr/bin/apt purge s3cmd',
    }
    ->
    package { 's3cmd' :
        ensure   => $s3cmd_version,
        provider => 'pip',
    }
}

# Install class
class s3cmd::install (
    $s3cmd_version,
    $s3cmd_provider,
    ){
    package { 's3cmd' :
        ensure   => $s3cmd_version,
        provider => $s3cmd_provider,
    }
}

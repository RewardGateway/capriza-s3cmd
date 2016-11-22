# Main class
class s3cmd (
    $aws_access_key,
    $aws_secret_key,
    $gpg_passphrase,
    $owner,
    $s3cmd_version  = latest,
    $s3cmd_provider = 'apt',
)
{
    class{'s3cmd::install':
        s3cmd_version  => $s3cmd_version,
        s3cmd_provider => $s3cmd_provider,
    }
    class{'s3cmd::config':
        aws_access_key => $aws_access_key,
        aws_secret_key => $aws_secret_key,
        gpg_passphrase => $gpg_passphrase,
        owner          => $owner,
        require        => Class['s3cmd::install'],
    }
}

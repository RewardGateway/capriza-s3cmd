# Config class
class s3cmd::config (
    $aws_access_key,
    $aws_secret_key,
    $gpg_passphrase,
    $owner,
) {
    $homedir = $owner ? {
        root    => '/root',
        default => "/home/${owner}",
    }
    file{"${homedir}/.s3cfg":
        owner   => $owner,
        content => template('s3cmd/s3cfg.erb'),
    }

}

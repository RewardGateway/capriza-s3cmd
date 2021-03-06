# Get class
define s3cmd::commands::get(
  $s3_object,
  $owner,
  $cwd
) {
    $homedir = $owner ? {
        root    => '/root',
        default => "/home/${owner}",
    }
    exec { $name :
        command => "s3cmd get -c ${homedir}/.s3cfg ${s3_object} ${name}",
        path    => ['/usr/local/bin','/usr/bin'],
        cwd     => $cwd,
        user    => $owner,
        creates => $name,
        require => Class['s3cmd::config','s3cmd::install'],
    }
}

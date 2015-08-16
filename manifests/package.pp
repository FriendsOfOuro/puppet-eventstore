class eventstore::package
{
  include eventstore::params

  $version = $eventstore::params::version
  $url     = $eventstore::params::url
  $dir     = $eventstore::params::dir
  $tarball = "/usr/local/src/EventStore-OSS-Linux-v$version.tar.gz"

  wget::fetch {$url:
    destination => $tarball
  } ->
  exec { 'untar_eventstore':
    command => "tar xvzf $tarball && mv EventStore-OSS-Linux-v$version eventstore-$version",
    cwd     => '/opt',
    creates => "${dir}-$version",
    path    => ['/bin', '/usr/bin'],
  } ->
  file { "${dir}":
    ensure => link,
    target => "${dir}-$version"
  }
}

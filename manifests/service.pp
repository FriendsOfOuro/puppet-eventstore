class eventstore::service
{
  $http_prefixes = $eventstore::params::http_prefixes

  file {'/etc/init.d/eventstore':
    ensure => present,
    content => template('eventstore/service.erb'),
    mode => '0755',
  }->
  service { 'eventstore':
    enable => true,
    ensure => 'running',
  }
}

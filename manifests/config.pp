class riak::config {

  file {'/etc/riak/app.config':
    ensure  => present,
    owner   => 'riak',
    group   => 'riak',
    mode    => 0644,
    content => template('riak/app.config.erb'),
  }

  file {'/etc/riak/vm.args':
    ensure  => present,
    owner   => 'riak',
    group   => 'riak',
    mode    => 0644,
    content => template('riak/vm.args.erb'),
  }

}

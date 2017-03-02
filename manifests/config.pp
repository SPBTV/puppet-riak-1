class riak::config inherits riak {

  file {'/etc/default/riak':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => 'ulimit -n 4096',
  }

  file {'/etc/riak/app.config':
    ensure  => present,
    owner   => 'riak',
    group   => 'riak',
    mode    => '0644',
    content => template('riak/app.config.erb'),
  }

  file {'/etc/riak/vm.args':
    ensure  => present,
    owner   => 'riak',
    group   => 'riak',
    mode    => '0644',
    content => template('riak/vm.args.erb'),
  }

}

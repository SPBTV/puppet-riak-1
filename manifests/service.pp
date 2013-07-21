class riak::service {

  service {'riak':
    ensure => running,
  }

}

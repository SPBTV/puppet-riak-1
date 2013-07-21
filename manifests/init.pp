class riak {

  class {'riak::package':
    notify => Class['riak::service'],
  }

  class {'riak::config':
    notify  => Class['riak::service'],
    require => Class['riak::package'],
  }

  class {'riak::service':
    require => Class['riak::config'],
  }

}

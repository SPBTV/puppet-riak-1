class riak(
# riak_api
  $pb_ip                    = '127.0.0.1',
  $pb_port                  = 8087,
# riak_core
  $ring_state_dir           = '/var/lib/riak/ring',
  $http_ip                  = '127.0.0.1',
  $http_port                = 8098,
  $handoff_port             = 8099,
  $dtrace_support           = false,
  $platform_bin_dir         = '/usr/sbin',
  $platform_data_dir        = '/var/lib/riak',
  $platform_etc_dir         = '/etc/riak',
  $platform_lib_dir         = '/usr/lib/riak/lib',
  $platform_log_dir         = '/var/log/riak',
# riak_kv
  $storage_backend          = 'riak_kv_bitcask_backend',
  $anti_entropy             = 'on',
  $anti_entropy_expire      = 604800000,
  $anti_entropy_concurrency = 2,
  $anti_entropy_tick        = 15000,
  $anti_entropy_data_dir    = '/var/lib/riak/anti_entropy',
  $mapred_name              = 'mapred',
  $mapred_2i_pipe           = true,
  $map_js_vm_count          = 8,
  $reduce_js_vm_count       = 6,
  $hook_js_vm_count         = 2,
  $js_max_vm_mem            = 8,
  $js_thread_stack          = 16,
  $http_url_encoding        = 'on',
  $vnode_vclocks            = true,
  $listkeys_backpressure    = true,
  $fsm_limit                = 50000,
  $object_format            = 'v1',
# riak_search
  $search_enabled           = false,
# merge_index
  $merge_index_data_root    = '/var/lib/riak/merge_index',
  $buffer_rollover_size     = 1048576,
  $max_compact_segments     = 20,
# bitcask
  $io_mode                  = 'erlang',
  $bitcask_data_root        = '/var/lib/riak/bitcask',
# eleveldb
  $eleveldb_data_root       = '/var/lib/riak/leveldb'
# lager
# riak_sysmon
# sasl
# riak_control
) {

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

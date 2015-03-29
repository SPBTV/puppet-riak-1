# Riak Module

[![Build Status](https://travis-ci.org/jbussdieker/puppet-riak.png?branch=master)](https://travis-ci.org/jbussdieker/puppet-riak)

I built this module to manage installing, configuring and running Riak for version 1.4.8 of Riak. If you are looking for the most up-to-date manifest, review [the community configuration management strategy](https://github.com/basho-labs/the-riak-community/blob/master/config-mgmt-strategy.md).

# Usage

Basic installation:

```puppet
class {'riak':
  node_name => 'riak@127.0.0.1',
}
```

Basic installation w/ Control

```puppet
class {'riak':
  node_name       => 'riak@127.0.0.1',
  https           => true,
  control_enabled => true,
  control_users   => [{
    user     => 'admin',
    password => 'password',
  }],
}
```

Limit epmd listen port range

```puppet
class {'riak':
  node_name       => 'riak@127.0.0.1',
  epmd_listen_min => 6000,
  epmd_listen_max => 7999,
}
```

Full list of options

```puppet
class {'riak':
  # vm.args
  node_name => 'riak@127.0.0.1',
  setcookie => 'riak',

  # kernel settings
  epmd_listen_min => 0,
  epmd_listen_max => 65535,

  # riak_api
  pb_ip   => '127.0.0.1',
  pb_port => 8087,

  # riak_core
  ring_state_dir     => '/var/lib/riak/ring',
  ring_creation_size => 64,
  https              => false,
  http_ip            => '127.0.0.1',
  http_port          => 8098,
  handoff_port       => 8099,
  dtrace_support     => false,
  platform_bin_dir   => '/usr/sbin',
  platform_data_dir  => '/var/lib/riak',
  platform_etc_dir   => '/etc/riak',
  platform_lib_dir   => '/usr/lib/riak/lib',
  platform_log_dir   => '/var/log/riak',

  # riak_kv
  storage_backend                => 'riak_kv_bitcask_backend',
  anti_entropy                   => 'on',
  anti_entropy_build_limit       => {
    num_builds   => 1,
    per_timespan => 3600000,
  },
  anti_entropy_expire            => 604800000,
  anti_entropy_concurrency       => 2,
  anti_entropy_tick              => 15000,
  anti_entropy_data_dir          => '/var/lib/riak/anti_entropy',
  anti_entropy_leveldb_opts      => {
    write_buffer_size => 4194304,
    max_open_files    => 20,
  },
  mapred_name                    => 'mapred',
  mapred_2i_pipe                 => true,
  map_js_vm_count                => 8,
  reduce_js_vm_count             => 6,
  hook_js_vm_count               => 2,
  js_max_vm_mem                  => 8,
  js_thread_stack                => 16,
  http_url_encoding              => 'on',
  vnode_vclocks                  => true,
  listkeys_backpressure          => true,
  fsm_limit                      => 50000,
  object_format                  => 'v1',

  # riak_search
  search_enabled => false,

  # merge_index
  merge_index_data_root => '/var/lib/riak/merge_index',
  buffer_rollover_size  => 1048576,
  max_compact_segments  => 20,

  # bitcask
  io_mode           => 'erlang',
  bitcask_data_root => '/var/lib/riak/bitcask',

  # eleveldb
  eleveldb_data_root => '/var/lib/riak/leveldb',

  # lager
  error_log             => '/var/log/riak/error.log',
  error_log_size        => 10485760,
  error_log_date        => '$D0',
  error_log_count       => 5,
  console_log           => '/var/log/riak/console.log',
  console_log_size      => 10485760,
  console_log_date      => '$D0',
  console_log_count     => 5,
  crash_log             => '/var/log/riak/crash.log',
  crash_log_msg_size    => 65536,
  crash_log_size        => 10485760,
  crash_log_date        => '$D0',
  crash_log_count       => 5,
  error_logger_redirect => true,
  error_logger_hwm      => 100,

  # riak_sysmon
  process_limit   => 30,
  port_limit      => 2,
  gc_ms_limit     => 0,
  heap_word_limit => 40111000,
  busy_port       => true,
  busy_dist_port  => true,

  # sasl
  sasl_error_logger => false,

  # riak_control
  control_enabled  => false,
  control_users    => [{user => "user", password => "pass"}],
  control_admin    => true
}
```

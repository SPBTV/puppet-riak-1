# Riak Module

[![Build Status](https://travis-ci.org/jbussdieker/puppet-riak.png?branch=master)](https://travis-ci.org/jbussdieker/puppet-riak)

This module manages installing, configuring and running Riak.

# Usage

Basic installation:

    class {'riak':
      node_name => 'riak@127.0.0.1',
    }

Basic installation w/ Control

    class {'riak':
      node_name       => 'riak@127.0.0.1',
      https           => true,
      control_enabled => true,
      control_users   => [{
        user     => 'admin',
        password => 'password',
      }],
    }

Limit epmd listen port range

    class {'riak':
      node_name       => 'riak@127.0.0.1',
      epmd_listen_min => 6000,
      epmd_listen_max => 7999,
    }

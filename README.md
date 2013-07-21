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
    }

# Riak Module

[![Build Status](https://travis-ci.org/jbussdieker/puppet-riak.png?branch=master)](https://travis-ci.org/jbussdieker/puppet-riak)

This module manages installing, configuring and running Riak.

# Usage

Basic installation:

    class {'riak':
    }

Basic installation w/ Control

    class {'riak':
      https                => true,
      riak_control_enabled => true,
    }

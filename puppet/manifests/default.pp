node default {

  require 'apt::transport_https'
  require 'apt::source::cargomedia'

  apt::key { 'docker':
    key        => '58118E89F3A912897C070ADBF76221572C52609D',
    key_server => 'hkp://p80.pool.sks-keyservers.net:80'
  }
  ->

  apt::source { 'docker':
    entries => [
      'deb https://apt.dockerproject.org/repo debian-jessie main',
    ]
  }

  package { 'docker-engine':
    provider => 'apt',
    ensure   => present,
  }


  class { 'golang': }

}

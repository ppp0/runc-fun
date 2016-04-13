class golang($version = '1.6.0') {

  require 'apt'
  require 'git'

  package { 'bison':
    ensure => present,
    provider => 'apt',
  }

  helper::script { 'install golang':
    content => template("${module_name}/install-golang.sh"),
    unless  => "v=$(go version) test '$v' != 'go version go${version} linux/amd64'",
    require => Package['bison'],
  }

  environment::variable { 'PATH':
    value => '/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
  }

  environment::variable { 'GOPATH':
    value => '/root/golang',
  }
}

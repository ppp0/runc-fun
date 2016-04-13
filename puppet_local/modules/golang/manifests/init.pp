class golang {

  require 'apt'
  require 'git'

  package { 'bison':
    ensure => present,
    provider => 'apt',
  }

  helper::script { 'install golang':
    content => template("${module_name}/install-golang.sh"),
    unless  => "which go",
    require => Package['bison'],
  }

}

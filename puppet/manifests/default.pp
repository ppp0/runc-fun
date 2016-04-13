node default {

  require 'docker'

  class { 'runc': }
}

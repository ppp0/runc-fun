class runc {

  require 'golang'

  helper::script { 'install runC':
    content => template("${module_name}/install-runc.sh"),
    unless  => "which runc",
  }
}

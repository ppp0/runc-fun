Vagrant.configure('2') do |config|
  if Vagrant.has_plugin?('vagrant-proxyconf')
    config.vm.synced_folder '.proxy-cache', '/tmp/proxy-cache', :owner => 'proxy', :create => true
    if ['true', '1'].include?(ENV['DISABLE_PROXY']) or true
      config.proxy.https = false
      config.proxy.http = false
    else
      config.proxy.https = 'http://localhost:8123/'
      config.proxy.http = 'http://localhost:8123/'
      config.proxy.no_proxy = '127.0.0.1,localhost'
    end
  else
    warn("Installing the vagrant plugin 'vagrant-proxyconf' is highly recommended for dramatic performance gains. \nRun\n \`vagrant plugin install vagrant-proxyconf\` to install it")
  end

  config.librarian_puppet.puppetfile_dir = 'puppet'
  config.librarian_puppet.placeholder_filename = '.gitkeep'
  config.librarian_puppet.resolve_options = {:force => true}

  config.vm.provision 'puppet' do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.manifest_file = 'default.pp'
    puppet.module_path = ['puppet/modules','puppet_local/modules']
  end

  config.vm.provider 'virtualbox' do |v|
    v.gui = (ENV['gui'] == 'true')
  end

  config.vm.define 'Debian-8' do |jessie|
    jessie.vm.box = 'cargomedia/debian-8-amd64-default'
    jessie.vm.network :forwarded_port, guest: 22, host: 22300, id: 'ssh'
  end
end

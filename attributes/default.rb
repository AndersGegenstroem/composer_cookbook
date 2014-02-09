default['composer']['installer_url'] = "https://getcomposer.org/installer"
default['composer']['install_dir'] = "/usr/local/bin"
default['composer']['install_global'] = false
default['composer']['usergroup'] = "composer"
default['composer']['users'] = {}

default['composer']['packagist']['enabled'] = true
default['composer']['repositories'] = []

default['composer']['login_scripts'] = ['.profile','.bashrc','.bash_profile']

case platform
when "redhat", "centos", "scientific", "fedora", "suse", "amazon", "oracle"
    default['composer']['packages'] = ['php','curl']
when "debian", "ubuntu"
    default['composer']['packages'] = ['php5','curl']
end
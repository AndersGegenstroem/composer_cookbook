directory "Create global COMPOSER_HOME directory" do
    path "/var/composer"
    mode 755
    action :create
end

template "Create global composer config" do
    path "/var/composer/config.json"
    source "config.json.erb"
    mode 0644
    variables ({
        :packagist    => node['composer']['packagist']['enabled'],
        :repositories => node['composer']['repositories']
    })
    action :create
end

file "Add COMPOSER_HOME to global environment" do
    path "/etc/profile.d/composer.sh"
    content "export COMPOSER_HOME=/var/composer"
    action :create
end
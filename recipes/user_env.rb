node['composer']['users'].each do |name, homedir|
    directory "Create Composer HOME for user '#{name}'" do
        path "#{homedir}/.composer"
        owner name
        mode 0700
        action :create
    end

    template "Create composer.config for user '#{name}'" do
        path "#{homedir}/.composer/config.json"
        source "config.json.erb"
        mode 0600
        owner name
        variables ({
            :packagist    => node['composer']['packagist']['enabled'],
            :repositories => node['composer']['repositories']
        })
        action :create
    end

    node['composer']['login_scripts'].each do |scriptname|
        execute "Export COMPOSER_HOME in file '#{scriptname}'" do
            command "echo 'export COMPOSER_HOME=\"#{homedir}/.composer\"' >> #{homedir}/#{scriptname}"
            action :run
            only_if {File.exists?("#{homedir}/#{scriptname}")}
        end
    end
end
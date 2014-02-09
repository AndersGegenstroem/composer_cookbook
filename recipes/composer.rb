execute "Install composer.phar" do
    command "curl -sS #{node['composer']['installer_url']} | php -- --install-dir=#{node['composer']['install_dir']}"
    action :run
end

file "Adjust file permissions for composer.phar" do
    path "#{node['composer']['install_dir']}/composer.phar"
    group node['composer']['usergroup']
    mode 0770
    action :create
end

link "Create symbolic link for composer.phar" do
    link_type :symbolic
    group node['composer']['usergroup']
    target_file "/usr/local/bin/composer"
    to "#{node['composer']['install_dir']}/composer.phar"
    only_if {node['composer']['install_dir'] != "/usr/local/bin"}
end
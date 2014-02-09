group "Create composer user group" do
    group_name node['composer']['usergroup']
    action :create
end

node['composer']['users'].each do |name, homedir|
    user "Add user '#{name}' to composer usergroup" do
        username name
        gid node['composer']['usergroup']
        action :manage
    end
end
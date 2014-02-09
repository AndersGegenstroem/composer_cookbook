include_recipe "composer::packages"
include_recipe "composer::composer"
include_recipe "composer::user"

if node['composer']['install_global']
    include_recipe "composer::global_env"
else
    include_recipe "composer::user_env"
end
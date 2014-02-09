node['composer']['packages'].each do |pckg|
    package "#{pckg}" do
        action :install
    end
end
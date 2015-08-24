include_recipe 'sprout-nginx::install_nginx'

launch_agents_path = File.expand_path(File.join(node.default['sprout']['home'], 'Library/LaunchAgents'))
directory launch_agents_path do
  action :create
  recursive true
  owner node['sprout']['user']
end

plist_filename = 'homebrew.mxcl.nginx.plist'
homebrew_root = '/usr/local'
install_path = File.join(homebrew_root, 'opt', "nginx")
source_plist_filename = File.join(install_path, plist_filename)
launch_agent_plist_filename = File.join(launch_agents_path, plist_filename)

link launch_agent_plist_filename do
  to source_plist_filename
end

execute 'start the daemon' do
  command "launchctl load -w #{launch_agent_plist_filename}"
  user node['sprout']['user']
end
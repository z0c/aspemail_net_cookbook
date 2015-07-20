require 'win32/service'

install_path = node['aspemail_net']['install_path']

if win_version.windows_server_2012? || win_version.windows_server_2012_r2?
  windows_feature 'NET-Framework-Core' do
    action :install
    provider Chef::Provider::WindowsFeaturePowershell
  end
else
  windows_feature 'NetFx3' do
    action :install
  end
end

directory "#{install_path}\\" do
  action :create
  recursive true
end

cookbook_file "#{install_path}\\EmailAgentNetRemote.dll" do
  action :create
  source 'EmailAgentNetRemote.dll'
end

cookbook_file "#{install_path}\\EmailAgentNetConfig.exe" do
  action :create
  source 'EmailAgentNetConfig.exe'
end

cookbook_file "#{install_path}\\EmailAgentNet.exe" do
  action :create
  source 'EmailAgentNet.exe'
end

template "#{install_path}\\EmailAgentNet.exe.config" do
  action :create_if_missing
  source 'EmailAgentNet.exe.config'
  variables(install_path: install_path)
end

execute 'install service' do
  action :run
  command "sc.exe create \"#{node['aspemail_net']['service_name']}\" binPath=\"#{install_path}\\EmailAgentNet.exe\""
  not_if { ::Win32::Service.exists?(node['aspemail_net']['service_name']) }
end

service node['aspemail_net']['service_name'] do
  supports status: true, restart: true
  action [:enable, :start]
end

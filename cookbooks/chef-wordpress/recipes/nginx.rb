#
# Cookbook Name:: chef-wordpress
# Recipe:: nginx
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Install Nginx
package 'nginx' do
  action :install
end

# Enable at boot
service 'nginx' do
  action :enable
end

# Create cofig file from template
template 'nginx.conf' do
  path "#{node['nginx']['dir']}/nginx.conf"
  source 'nginx.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, resources(:service => 'nginx')
end

# Add site vhost config  WORK IN PROGRESS
template node['nginx']['site'] do
  path "/etc/nginx/sites-available/#{node['nginx']['site']}"
  source 'site.conf.erb'
end

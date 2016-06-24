#
# Cookbook: teleport
# License: Apache 2.0
#
# Copyright 2016, Bloomberg Finance L.P.
#

url = node['teleport']['archive_url'] % {
  version: node['teleport']['version'],
  os: node['os'],
  arch: node['kernel']['machine'] == 'x86_64' ? 'amd64' : node['kernel']['machine']
}

extract_path = directory File.join(node['teleport']['prefix'], 'teleport', node['teleport']['version']) do
  recursive true
  mode '0755'
end

ruby_block File.basename(url) do
  block { }
  notifies :create, "remote_file[#{name}]"
  notifies :unpack, "poise_archive[#{name}]"
  not_if { File.exist?(File.join(extract_path.path, 'teleport')) }
end

remote_file File.basename(url) do
  action :nothing
  path File.join(Chef::Config[:file_cache_path], name)
  source url
  checksum node['teleport']['archive_checksum']
end

poise_archive File.basename(url) do
  action :nothing
  path File.join(Chef::Config[:file_cache_path], name)
  user 'root'
  group node['root_group']
  destination extract_path.path
end

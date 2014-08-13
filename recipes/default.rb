#
# Cookbook Name:: openclerk
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apache2"
include_recipe "mysql::client"
include_recipe "mysql::server"
include_recipe "php"

# install PHP module dependencies with apt (replace deprecated php::module_XXX)
package "php5-gd"
package "php5-curl"
package "php5-mysql"

include_recipe "apache2::mod_php5"
include_recipe "nodejs"
include_recipe "grunt_cookbook"

# necessary for mysql_database*
include_recipe "database::mysql"

apache_site "default" do
  enable false
end

cookbook_file "phpinfo.php" do
  path "/var/www/phpinfo.php"
end

mysql_database node['openclerk']['database'] do
  connection(
    :host     => 'localhost',
    :username => 'root',
    :password => node['mysql']['server_root_password']
  )
  action :create
end

mysql_database_user node['openclerk']['db_username'] do
  connection(
    :host     => 'localhost',
    :username => 'root',
    :password => node['mysql']['server_root_password']
  )
  password node['openclerk']['db_password']
  database_name node['openclerk']['database']
  privileges [:select, :update, :insert, :create, :delete]
  action :grant
end

directory node['openclerk']['path'] do
  owner "root"
  group "root"
  mode "0755"
  action :create
  recursive true
end

package "subversion"

subversion "Openclerk" do
  repository "http://openclerk.googlecode.com/svn/trunk/"
  revision "HEAD"
  destination node['openclerk']['path']
  action :sync
end

web_app "openclerk" do
  template "site.conf.erb"
  docroot node['openclerk']['path'] + "/site"
  server_name node['openclerk']['server_name']
end

# install our own local composer, replaces include_recipe 'composer' which uses 'admin' group (which doesn't exist)
composer node['openclerk']['path'] do
  global false
  owner "root"
  group "root"
  action :install
end

composer_package node['openclerk']['path'] do
  user "root"
  group "root"
  action :install
end

# install bundler
include_recipe "chef_bundler::bundler"

chef_bundler_install node['openclerk']['path'] do
  action :install
end

# install npm dependencies
grunt_cookbook_npm node['openclerk']['path'] do
  action :install
end

# build with grunt
grunt_cookbook_grunt node['openclerk']['path'] do
  action :task
  task "build"
end

directory node['openclerk']['path'] + "/config" do
  owner "root"
  group "root"
  mode "0755"
  action :create
  recursive true
end

# reconfigure config.php
template node['openclerk']['path'] + "/config/config.php" do
  source "config.php.erb"
  mode 0755
  owner 'root'
  group 'root'
end

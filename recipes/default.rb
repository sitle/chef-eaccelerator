#
# Cookbook Name:: eaccelerator
# Recipe:: default
#
# Copyright (C) 2014 Leonard TAVAE
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

%w(git-core php5-dev).each do |pkg|
  package pkg do
    action :install
  end
end

git '/root/eaccelerator' do
  repository 'https://github.com/eaccelerator/eaccelerator.git'
  reference 'master'
  user 'root'
  group 'root'
  action :sync
  not_if 'ls /etc/php5/mods-available/eaccelerator.ini'
end

bash 'Build and install eaccelerator php plugin' do
  cwd '/root/eaccelerator'
  code <<-EOH
  phpize
  ./configure
  make
  make install
  cp eaccelerator.ini /etc/php5/mods-available/
  cd ..
  rm -fr eaccelerator
  EOH
  not_if 'ls /etc/php5/mods-available/eaccelerator.ini'
end

if node['eaccelerator']['activate']
  link '/etc/php5/conf.d/eaccelerator.ini' do
    to '/etc/php5/mods-available/eaccelerator.ini'
  end
else
  link '/etc/php5/conf.d/eaccelerator.ini' do
    action :delete
    only_if 'ls -l /etc/php5/conf.d/eaccelerator.ini'
  end
end

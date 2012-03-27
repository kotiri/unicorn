#
# Author:: Adam Jacob <adam@opscode.com>
# Cookbook Name:: unicorn
# Provider:: config
#
# Copyright 2009-2012, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

action :create do
  config_dir = File.dirname(new_resource.name)

  directory config_dir do
    recursive true
    action :create
  end

  tvars = new_resource.to_hash
  new_resource.listen.each do |port, options|
    oarray = Array.new
    options.each do |k, v|
      oarray << ":#{k} => #{v}"
    end
    tvars[:listen][port] = oarray.join(", ")
  end

  template new_resource.name do
    source "unicorn.rb.erb"
    cookbook "unicorn"
    mode "0644"
    owner new_resource.owner if new_resource.owner
    group new_resource.group if new_resource.group
    mode new_resource.mode if new_resource.mode
    variables new_resource.to_hash
    notifies *new_resource.notifies if new_resource.notifies
  end

  new_resource.updated_by_last_action(true)
end

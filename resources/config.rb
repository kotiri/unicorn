#
# Author:: Adam Jacob <adam@opscode.com>
# Cookbook Name:: unicorn
# Resource:: config
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
actions :create

attribute :listen, :kind_of => Hash, :default => {}
attribute :working_directory, :kind_of => String, :default => nil
attribute :worker_timeout, :kind_of => Integer, :default => 60
attribute :preload_app, :kind_of => [TrueClass, FalseClass], :default => false
attribute :worker_processes, :kind_of => Integer, :default => 4
attribute :before_fork, :kind_of => String, :default => nil
attribute :after_fork, :kind_of => String, :default => nil
attribute :pid, :kind_of => Integer, :default => nil
attribute :stderr_path, :kind_of => String, :default => nil
attribute :stdout_path, :kind_of => String, :default => nil
attribute :notifies, :kind_of => Array, :default => []
attribute :owner, :kind_of => String, :default => nil
attribute :group, :kind_of => String, :default => nil
attribute :mode, :kind_of => String, :default => nil

def initialize(*args)
  super
  @action = :create
end

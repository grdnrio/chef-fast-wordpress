#
# Cookbook Name:: chef-wordpress
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apt::default'
include_recipe 'chef-wordpress::nginx'

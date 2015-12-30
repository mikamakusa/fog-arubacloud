require 'bundler/gem_tasks'

require 'rubygems'
require 'bundler/setup'
require File.dirname(__FILE__) + '/lib/fog/arubacloud'

task :default => :test
mock = ENV['FOG_MOCK'] || 'true'
task :test do
  sh("export FOG_MOCK=#{mock} && bundle exec shindont")
end
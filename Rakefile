require 'bundler/gem_tasks'

require 'rubygems'
require 'bundler/setup'
require 'rake/testtask'

require File.dirname(__FILE__) + '/lib/fog/arubacloud'

task :default => :test
mock = ENV['FOG_MOCK'] || 'true'

Rake::TestTask.new do |t|
  t.pattern = File.join('spec', '**', '*_spec.rb')
  t.libs << 'spec'
end

namespace :test do
  task :arubacloud_specs do
    sh('export FOG_MOCK=false && bundle exec rspec spec/fog/arubacloud/*_spec.rb')
  end
  task :travis => [:arubacloud_specs] do
    sh("export FOG_MOCK=#{mock} && bundle exec shindont")
  end
end
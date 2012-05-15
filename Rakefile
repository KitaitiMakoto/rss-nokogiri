#!/usr/bin/env rake
require 'rake/testtask'
require 'yard'
require "bundler/gem_tasks"

task :default => :test

Rake::TestTask.new do |t|
  t.ruby_opts << '-I test/regression'
  t.test_files = FileList['test/**/test_*.rb']
end
YARD::Rake::YardocTask.new

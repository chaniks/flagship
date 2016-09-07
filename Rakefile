require "bundler/gem_tasks"
require "rspec/core/rake_task"

begin
  namespace :spec do
    desc "Run rspec tests, but only essential ones"
    RSpec::Core::RakeTask.new(:default)

    desc "Run all rspec tests, including exhaustive and performance tests"
    task :all => [:default]
  end
rescue LoadError
end

task :default => :test

desc "alias for test:default"
task :test => "test:default"

namespace :test do
  desc "Run only essential tests"
  task :default => "spec:default"

  desc "Run all tests, including performance and exhaustive tests"
  task :all => [:default]
end

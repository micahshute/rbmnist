require "bundler/gem_tasks"
require "rspec/core/rake_task"

spec = Gem::Specification.find_by_name 'gspec'
load "#{spec.gem_dir}/lib/gspec/tasks/generator.rake"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec


task :console do
    require 'pry'
    require_relative './lib/rbmnist'
    Pry.start
end
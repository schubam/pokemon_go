require "bundler/gem_tasks"
require 'rake/testtask'

task :default => :spec

Rake::TestTask.new(:spec) do |t|
  t.pattern = 'spec/pokemon_go/*_spec.rb'
end

task :console do
  system("./bin/console")
end

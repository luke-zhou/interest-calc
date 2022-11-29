# frozen_string_literal: true

require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'optparse'

RSpec::Core::RakeTask.new(:test)

RuboCop::RakeTask.new(:lint) do |task|
  task.patterns = ['lib/**/*.rb', 'spec/**/*.rb']
  task.fail_on_error = false
end

task default: %w[lint test]

task :run, [:file] do |t, args|
  ruby 'lib/main.rb'
end
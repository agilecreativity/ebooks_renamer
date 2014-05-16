require "bundler/gem_tasks"
require "rake/testtask"
project_name = "ebooks_renamer"

Rake::TestTask.new do |t|
  t.libs << "lib/#{project_name}"
  t.test_files = FileList["test/lib/#{project_name}/test_*.rb"]
  t.verbose = true
end

task default: [:test, :rubocop]
task :pry do
  require "pry"
  require "awesome_print"
  require_relative "lib/ebook_meta"
  include EbooksRenamer
  ARGV.clear
  Pry.start
end

require "rubocop/rake_task"
desc "Run RuboCop on the lib directory"
Rubocop::RakeTask.new(:rubocop) do |task|
  task.patterns = ["lib/**/*.rb"]
  # only show the files with failures
  task.formatters = ["files"]
  # don't abort rake on failure
  task.fail_on_error = false
end

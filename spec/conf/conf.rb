# I dont want my spec helper to be displayed when helper fails
module InProjectSourceDirRegexPatch
  def in_project_source_dir_regex
    regexes = project_source_dirs.map do |dir|
      next if dir == "spec"
      /\A#{Regexp.escape(File.expand_path(dir))}\//
    end.compact
    Regexp.union(regexes)
  end
end
RSpec::Core::Configuration.prepend InProjectSourceDirRegexPatch

# I always use both should & expect syntaxes
RSpec.configure do |conf|
  conf.expect_with(:rspec)  { |c| c.syntax = [:should, :expect] }
  conf.mock_with(:rspec)    { |c| c.syntax = [:should, :expect] }
end

# I want my Flagship test to be tested first for documentation purpose
RSpec.configure do |conf|
  conf.exclude_pattern = "spec/flagship_spec.rb"
  require "flagship_spec"
end

# I want to suppress Pending notifications from RSpec
#   it is flood of information
require 'rspec/core/formatters/base_text_formatter'
module SuppressPendingMessage
  def dump_pending(arg)
  end
end
RSpec::Core::Formatters::BaseTextFormatter.prepend SuppressPendingMessage

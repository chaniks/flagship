require 'spec_helper'
require 'flagship'

describe File do
  describe '#in_files?' do
    let(:file) { __FILE__ }
    it 'determines if file is in the list' do
      expr {
        File.open(file) do |f|
          f.in_files? ["spec/file_spec.rb", "b.txt"]
        end
      }.should_return true
    end
  end
end

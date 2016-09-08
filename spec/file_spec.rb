require 'spec_helper'
require 'flagship'

require 'shared_contexts/xml_file'

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

  describe '#xpath' do
    include_context 'xml_file',
      content: %{ <a><b c="d">Hello World</b></a> }

    let(:file) { File.new(xml_file.path) }

    it 'returns array of values found with the given xpath expression' do
      file.xpath('/a/b/text()').should eq ['Hello World']
      file.xpath('/a/b/@c').first.should match /c=('d'|"d")/
    end

    specify 'return values are Strings' do
      file.xpath('/a/b').should all(be_a(String))
    end

    it 'attaches #value method to attribute results' do
      file.xpath('/a/b/@c').first.value.should eq 'd'
    end
  end
end

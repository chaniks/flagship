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
      file.xpath('/a/b/@c').first.should eq 'd'
    end

    specify 'return values are Strings' do
      file.xpath('/a/b').should all(be_a(String))
    end

    specify 'attribute return values have #attr_name method' do
      file.xpath('/a/b/@c').first.attr_name.should eq 'c'
    end

    specify 'return values have #to_xml method' do
      file.xpath('/a/b').first.to_xml.should eq "<b c='d'>Hello World</b>"
      file.xpath('/a/b/@c').first.to_xml.should eq "c='d'"
    end
  end
end

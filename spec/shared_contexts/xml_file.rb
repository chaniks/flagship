require 'tempfile'

shared_context "xml_file" do |content: nil|
  tfile = nil # declared for local context

  before do
    tfile = Tempfile.new('xml')
    tfile.write(content)
    tfile.close
  end

  after do
    tfile.delete
  end

  let(:xml_file) { tfile }
end

require 'spec_helper'
require 'flagship'

describe String do
  describe '#in_files?' do
    it 'checks if the string is in given list of files' do
      expr {
        'a.txt'.in_files?(['a.txt','b.txt','c.txt'])
      }.should_return true
      expr {
        'a.txt'.in_files?(['aa.txt','b.txt','c.txt'])
      }.should_return false
    end

    it 'can check even if the given string is not in the same format' do
      expr {
        'a.txt'.in_files?(['./a.txt','b.txt','c.txt'])
      }.should_return true
    end
  end
end

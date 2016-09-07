require 'spec_helper'
require 'flagship'

describe Array do
  describe '#unique?' do
    it 'should determine if array has duplicated items' do
      [1,2,3].unique? .should be true
      [1,2,1].unique? .should be false
    end
  end
end

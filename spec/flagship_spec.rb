require 'spec_helper'
require 'flagship'

describe Flagship do
  it 'has a version number' do
    expect(Flagship::VERSION).not_to be nil
  end

  it 'should define Array#unique?' do
    [].should respond_to(:unique?)
  end
end

require 'spec_helper'
require 'flagship'

describe Flagship do
  it 'has a version number' do
    expect(Flagship::VERSION).not_to be nil
  end

  it 'defines Array#unique?' do
    [].should respond_to(:unique?)
  end

  it "defines Object#in?" do
    Object.new.should respond_to(:in?)
  end
end

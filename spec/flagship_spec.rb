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

  it "defines File#in_files?" do
    # i know. i hate this too.
    File.open(__FILE__) do |f|
      f.should respond_to(:in_files?)
    end
  end

  it 'defines String#in_files?' do
    "a".should respond_to(:in_files?)
  end

  it 'defines #with as DSL' do
    self.should respond_to(:with)
  end

  it 'defines File#xpath' do
    File.open(__FILE__) do |f|
      f.should respond_to(:xpath)
    end
  end
end

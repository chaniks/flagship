require 'spec_helper'
require 'flagship'

describe Object do
  describe "#in?" do
    it "determines if itself is in the given list" do
      expect( "a".in? ["a", "b", "c"] ).to be true
      expect( "d".in? ["a", "b", "c"] ).to be false
    end
  end
end

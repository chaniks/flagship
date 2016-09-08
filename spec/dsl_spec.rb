require 'spec_helper'
require 'flagship'

describe Flagship::DSL do
  describe "#with" do
    it 'runs the given block but returns the given value' do
      foo = 'foo'
      bar = 'bar'
      foobar = nil
      expr = expr {
        with(foo) do
          foobar = foo + bar
        end
      }
      expr.should change { foobar }.from(nil).to('foobar')
      expr.should_return 'foo'
    end
  end
end

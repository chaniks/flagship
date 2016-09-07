$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

def expr(&block)
  block
end

class Proc
  def should_return(value)
    self.call.should == value
  end
end

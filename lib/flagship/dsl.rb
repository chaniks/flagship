
module Flagship::DSL
  module With
    def with(obj, &block)
      yield obj
      obj
    end
  end
end

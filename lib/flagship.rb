require "flagship/version"

module Flagship
  module ArrayIdioms
    def unique?
      self == self.uniq
    end
  end
  Array.prepend ArrayIdioms
end

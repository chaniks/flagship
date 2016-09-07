require "flagship/version"

module Flagship
  module ArrayIdioms
    def unique?
      self == self.uniq
    end
  end

  module ObjectUtils
    def in?(enum)
      enum.include? self
    end
  end

  ::Array.prepend ArrayIdioms
  ::Object.prepend ObjectUtils
end

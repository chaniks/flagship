require "flagship/version"

module Flagship
  module ArrayIdioms
    def unique?
      self == self.uniq
    end
  end

  def self.expand
    Array.prepend ArrayIdioms
  end
end

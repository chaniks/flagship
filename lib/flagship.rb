require "flagship/version"

require 'flagship/array'
require 'flagship/object'

module Flagship
  ::Array.prepend ArrayIdioms
  ::Object.prepend ObjectUtils
end

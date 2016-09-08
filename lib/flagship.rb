require "flagship/version"

require 'flagship/array'
require 'flagship/object'
require 'flagship/file'
require 'flagship/dsl'

module Flagship
  ::Array.prepend ArrayIdioms
  ::Object.prepend ObjectUtils
  ::File.prepend FileUtils
  ::String.prepend FileUtils
  ::File.prepend XPathSupport
end

include Flagship::DSL::With

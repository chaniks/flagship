require "flagship/version"

require 'flagship/array'
require 'flagship/object'
require 'flagship/file'

module Flagship
  ::Array.prepend ArrayIdioms
  ::Object.prepend ObjectUtils
  ::File.prepend FileUtils
  ::String.prepend FileUtils
end

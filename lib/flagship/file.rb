require 'flagship/dsl'

module Flagship
  module FileUtils
    def in_files?(enum)
      enum.any? { |e| File.absolute_path(e) == File.absolute_path(self) }
    end
  end

  module XPathSupport
    def self.prepended(mod)
      # reduce overhead by requiring dependencies on demand
      require 'rexml/document'
    end

    def xpath(expr)
      @xml ||= REXML::Document.new(self)
      REXML::XPath.match(@xml, expr).map(&Utils.method(:node2str))
    end
  end

  module XPathSupport::Utils
    extend Flagship::DSL::With
    private_class_method :with

    def self.node2str(node)
      REXML::Attribute === node ? attr2str(node) : node.to_s
    end

    def self.attr2str(attr)
      with(attr.to_string) do |str|
        str.define_singleton_method(:value) { attr.to_s }
      end
    end
  end
end

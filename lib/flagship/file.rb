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
      case(node)
      when REXML::Attribute then attr2str(node)
      when REXML::Element   then elem2str(node)
      else                       elem2str(node)
      end
    end

    def self.attr2str(attr)
      with(attr.to_s) do |str|
        str.define_singleton_method(:to_xml) { attr.to_string }
        str.define_singleton_method(:attr_name) { attr.name }
      end
    end

    def self.elem2str(elem)
      with(elem.to_s) do |str|
        str.define_singleton_method(:to_xml) { elem.to_s }
      end
    end
  end
end

require 'rexml/document'

require "cuenote/api/base"

module Cuenote::Api
  class Node < Base
    def initialize(doc=nil)
      @doc =
        case doc
        when REXML::Element
          doc
        when String
          REXML::Document.new(doc)
        else
          REXML::Document.new('<a/>')
        end
    end

    def attributes
      @attributes ||= @doc.attributes.inject({}) do
        |hash, attr| hash[attr[0].to_sym] = attr[1]
        hash
      end
    end

    def elements
      @doc.elements
    end
  end
end

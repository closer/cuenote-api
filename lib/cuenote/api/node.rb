require 'rexml/document'

module Cuenote::Api
  class Node
    def initialize(doc)
      # doc.elements['forcast/result']
      @doc = REXML::Document.new(doc)
    end

    def attributes
      @attributes ||= @doc.attributes.inject({}) do
        |hash, attr| hash[attr[0].to_sym] = attr[1]
        hash
      end
    end

    def elements
      @params ||= @doc.elements.map.inject({}) do |hash, element|
        hash[element.name.to_sym] = element.text
        hash
      end
    end
  end
end

require 'rexml/document'

module Cuenote::Api
  class Response
    def initialize(response)
      @response = response
    end

    def attributes
      @attributes ||= result.attributes.inject({}) do
        |hash, attr| hash[attr[0].to_sym] = attr[1]
        hash
      end
    end

    def params
      @params ||= result.elements.map.inject({}) do |hash, element|
        hash[element.name.to_sym] = element.text
        hash
      end
    end

    def result
      @result ||= doc.elements['forecast/result']
    end

    def doc
      @doc ||= REXML::Document.new @response.body
    end
  end
end

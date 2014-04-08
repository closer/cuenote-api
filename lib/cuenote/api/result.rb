require "cuenote/api/node"

module Cuenote::Api
  class Result < Node
    def initialize(doc=nil)
      super
      @doc = @doc.elements['forcast/result']
    end
  end
end

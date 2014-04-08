require "cuenote/api/base"

module Cuenote::Api
  class Import < Base
    def initialize(params={})
      @params = params
    end

    def set params={}
      res = run 'setImportEntry', @params.merge(params)
      @impid = res.attributes[:impid]
    end

    def get params={}
      @impid
    end

    def test params={}
      @impid
    end

    def start params={}
      run 'startImportEntry', params.merge(impid: @impid)
    end
  end
end

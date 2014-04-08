require "cuenote/api/base"

module Cuenote::Api
  class Import < Base
    def set params={}
      res = run 'setImportEntry', 1, params
      @impid = res.attributes[:impid]
    end

    def get params={}
      @impid
    end

    def test params={}
      @impid
    end

    def start params={}
      run 'startImportEntry', 1, params.merge(impid: @impid)
    end
  end
end

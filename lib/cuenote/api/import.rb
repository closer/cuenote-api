require "cuenote/api/base"

module Cuenote::Api
  class Import < Base
    def initialize(options={})
      @options = options
    end

    def set
      req = Request.new
      req.add_command 'setImportEntry', 1, @options
      res = connection.send req
      @impid = res.attributes[:impid]
    end

    def get
      @impid
    end

    def test
      @impid
    end

    def start
      req = Request.new
      req.add_command 'startImportEntry', 1, impid: @impid
      res = connection.send req
    end
  end
end

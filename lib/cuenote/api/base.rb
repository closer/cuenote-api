require "cuenote/api/request"
require "cuenote/api/response"

module Cuenote::Api
  class Base
    def connection
      Connection.new
    end
  end
end

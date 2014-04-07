require "cuenote/api/request"
require "cuenote/api/response"
require "cuenote/api/connection"

module Cuenote::Api
  class Base
    def connection
      Connection.new
    end
  end
end

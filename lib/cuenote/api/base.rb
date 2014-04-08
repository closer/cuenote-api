require "cuenote/api/command"
require "cuenote/api/connection"
require "cuenote/api/response"

module Cuenote::Api
  class Base
    def self.connection(command)
      Connection.new(command)
    end

    def self.run(command, params={})
      connection(Command.new(command, params)).response
    end

    def connection(command)
      self.class.connection command
    end

    def run(command, params={})
      self.class.run command, params
    end
  end
end

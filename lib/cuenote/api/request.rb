require "cuenote/api/xml_builder"
require "cuenote/api/config"
require 'net/http'

module Cuenote::Api
  class Request
    def req
      req = Net::HTTP::Post.new(uri)
      req.basic_auth user, password
      req.content_type = 'form-data'
      req.body = body
      req
    end

    def add_command command, id, params
      builder.add_command command, id, params
    end

    def builder
      @builder ||= Cuenote::Api::XmlBuilder.new
    end

    def body
      {
        CCC: "愛",
        xml: builder.build
      }
    end

    def uri
      @uri ||= URI(config.endpoint)
    end

    def user
      config.user
    end

    def password
      config.password
    end

    def config
      Cuenote::Api.config
    end
  end
end

require "net/http"
require "builder"

require "cuenote/api/command"
require "cuenote/api/result"

module Cuenote::Api
  class Connection
    def initialize *commands
      @commands = commands
    end

    def send
      Net::HTTP.start uri.hostname, uri.port, use_ssl: (uri.scheme == 'https') do |http|
        http.request request
      end.tap {|res| puts res.body }
    end

    def response
      @response ||= Result.new(send.body)
    end

    def request
      req = Net::HTTP::Post.new(uri)
      req.basic_auth username, password
      req.content_type = 'form-data'
      req.body = body.map{|k,v| "#{k}=#{v}" }.join("&")
      req
    end

    def builder
      @builder ||= ::Builder::XmlMarkup.new
    end

    def body
      {
        CCC: "愛",
        xml: build
      }
    end

    def build
      builder.forcast do |forcast|
        @commands.map.with_index do |command, id|
          forcast << command.build(id)
        end
      end.tap{|xml| puts xml }
    end

    def uri
      @uri ||= URI(config.endpoint)
    end

    def username
      config.username
    end

    def password
      config.password
    end

    def config
      Cuenote::Api.config
    end
  end
end

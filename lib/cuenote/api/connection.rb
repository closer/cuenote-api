require "net/http"
require "builder"

require "cuenote/api/command"

module Cuenote::Api
  class Connection
    def initialize *commands
      @commands = commands
    end

    def send
      Net::HTTP.start uri.hostname, uri.port, use_ssl: (uri.scheme == 'https') do |http|
        http.request request
      end
    end

    def response
      @response ||= Result.new(send)
    end

    def request
      req = Net::HTTP::Post.new(uri)
      req.basic_auth user, password
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
        xml: builder.build
      }
    end

    def build
      @builder.forcast do |forecast|
        @commands.each_with_index do |command, id|
          command.build id
        end
      end
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

module Cuenote::Api
  class Connection
    def send(req)
      response = Net::HTTP.start uri.hostname, uri.port, use_ssl: (uri.scheme == 'https') do |http|
        http.request req
      end
      Response.new response
    end
  end
end

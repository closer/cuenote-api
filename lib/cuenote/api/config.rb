module Cuenote::Api
  CONFIG_DEFAULT = {
    endpoint: "http://asp.cuenote.jp/api/fcio.cgi"
  }.freeze

  class Config
    def initialize
      @config = CONFIG_DEFAULT.dup
    end

    def method_missing name, value=nil
      if value
        set name, value
      else
        get name
      end
    end

    def set name, value
      @config[name.to_sym] = value
    end

    def get name
      @config[name.to_sym]
    end
  end

  def self.config
    @config ||= Config.new
  end

  def self.configure &block
    block.call config
  end
end

require "builder"

module Cuenote::Api
  class Command
    def initialize(command, params={})
      @command, @params = [command, params]
    end

    def builder
      @builder ||= ::Builder::XmlMarkup.new
    end

    def build(id)
      build_command @command, id, @params
    end

    private

    def build_command command, id, params
      options = {}
      options[:id] = id if id
      options[:command] = command
      if params && params.size > 0
        builder.execute options do |exec|
          exec.parameter do |parameter|
            params.each do |key, val|
              eval "parameter.#{key} \"#{val}\""
            end
          end
        end
      else
        builder.execute options
      end
    end
  end
end

require "builder"

module Cuenote
  module Api
    class XmlBuilder
      def initialize
        @builder = ::Builder::XmlMarkup.new
        @commands = []
      end

      def add_command command, id=nil, params=nil
        id, params = [nil, id] if id && !params && Hash === id
        @commands << [command, id, params]
      end

      def build
        @builder.forecast do |forecast|
          @commands.each do |command, id, params|
            build_command command, id, params
          end
        end
      end

      private

      def build_command command, id, params
        options = {}
        options[:id] = id if id
        options[:command] = command
        if params
          @builder.execute options do |exec|
            exec.parameter do |parameter|
              params.each do |key, val|
                eval "parameter.#{key} #{val}"
              end
            end
          end
        else
          @builder.execute options
        end
      end
    end
  end
end

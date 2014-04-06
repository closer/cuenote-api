module Cuenote
  module Api
    class XmlBuilder
      def initialize
        @builder = ::Builder::XmlMarkup.new
        @commands = []
      end
    end
  end
end

require "cuenote-api"

module Cuenote::Api
  class Address
    def initialize(element=nil)
      @element = element
      @adbook = element.attributes[:adbook]
    end

    # TODO
    def update
      run 'editAddress'
    end

    # TODO
    def delete
      run 'deleteAddress'
    end
  end
end

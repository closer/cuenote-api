require "cuenote/api/base"

module Cuenote::Api
  class AddressBook < Base
    def initialize
      @adbook = nil
    end

    def self.list
      res = run 'getAdBookList'
      res.result.elements['adbookinfo'].map do |element|
        Address.new(element)
      end
      res.result.elements['adbookinfo']
    end

    # TODO
    def self.create
    end

    # TODO
    def update
    end

    # TODO
    def delete
    end

    # TODO
    def information
    end

    # TODO
    def addresses
    end

    # TODO
    def add
    end

    # TODO
    def select
    end
  end
end

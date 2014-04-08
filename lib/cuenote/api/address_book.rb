require "cuenote/api/node"

module Cuenote::Api
  class AddressBook < Node
    def initialize(doc=nil)
      super doc
      @adbook = attributes[:adbook]
      puts doc.class
    end

    def self.list
      res = run 'getAdBookList'
      res.elements.map do |element|
        AddressBook.new(element)
      end
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

    def import
      @import ||= Import.new(adbook: @adbook)
    end
  end
end

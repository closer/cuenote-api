require "spec_helper"

describe Cuenote::Api::Request do
  before do
    @request = Cuenote::Api::Request.new
  end

  it "send" do
    stub_request(:any, Cuenote::Api.config.endpoint)
  end
end

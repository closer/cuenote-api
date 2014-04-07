require "spec_helper"

describe Cuenote::Api::Response do
  before do
  end

  it do
    stub_request(:any, Cuenote::Api.config.endpoint)
      .to_return(body: '<forecast><result command="setImportEntry" id="1"> <impid>1</impid><status>ok</status> <statuscode>1</statuscode></result></forecast>')
    request = Cuenote::Api::Request.new
    # expect(@response.attributes).to eq({ command: "setImportEntry", id: '1'})
    # expect(@response.params).to eq({ impid: '1', status: 'ok', statuscode: '1' })
  end
end

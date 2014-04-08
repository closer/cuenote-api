require "spec_helper"

describe Cuenote::Api::Command do
  it "build xml" do
    @builder = Cuenote::Api::Command.new 'command', { key: 'val' }
    expect(@builder.build(1)).to eq <<-XML.chomp
<execute id="1" command="command"><parameter><key>val</key></parameter></execute>
    XML
  end

  it "build xml without params" do
    @builder = Cuenote::Api::Command.new 'command'
    expect(@builder.build(1)).to eq <<-XML.chomp
<execute id="1" command="command"/>
    XML
  end
end

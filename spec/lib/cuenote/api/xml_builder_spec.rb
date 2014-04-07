require "spec_helper"

describe Cuenote::Api::XmlBuilder do
  before do
    @builder = Cuenote::Api::XmlBuilder.new
  end

  it "build xml" do
    @builder.add_command 'command', 1, { key: 'val' }
    expect(@builder.build).to eq <<-XML.chomp
<forecast><execute id="1" command="command"><parameter><key>val</key></parameter></execute></forecast>
    XML
  end

  it "build xml without id" do
    @builder.add_command 'command', { key: 'val' }
    expect(@builder.build).to eq <<-XML.chomp
<forecast><execute command="command"><parameter><key>val</key></parameter></execute></forecast>
    XML
  end

  it "build xml without params" do
    @builder.add_command 'command', 1
    expect(@builder.build).to eq <<-XML.chomp
<forecast><execute id="1" command="command"/></forecast>
    XML
  end

  it "build xml only command name" do
    @builder.add_command 'command'
    expect(@builder.build).to eq <<-XML.chomp
<forecast><execute command="command"/></forecast>
    XML
  end
end

require "spec_helper"

describe Cuenote::Api::Config do
  it "default config" do
    expect(Cuenote::Api.config.endpoint).to eq "http://asp.cuenote.jp/api/fcio.cgi"
  end

  it "changed config" do
    Cuenote::Api.config.endpoint "https://hoge.asp.cuenote.jp/api/fcio.cgi"
    expect(Cuenote::Api.config.endpoint).to eq "https://hoge.asp.cuenote.jp/api/fcio.cgi"
  end

  it "changed config with configure" do
    Cuenote::Api.configure do |config|
      config.endpoint "https://hoge.asp.cuenote.jp/api/fcio.cgi"
    end
    expect(Cuenote::Api.config.endpoint).to eq "https://hoge.asp.cuenote.jp/api/fcio.cgi"
  end
end

require "spec_helper"

describe Cuenote::Api::Config do
  it "changed config" do
    Cuenote::Api.config.endpoint "https://hoge.asp.cuenote.jp/api/fcio.cgi"
    expect(Cuenote::Api.config.endpoint).to eq "https://hoge.asp.cuenote.jp/api/fcio.cgi"
  end

  it "changed config with configure" do
    Cuenote::Api.configure do |config|
      config.endpoint "https://moge.asp.cuenote.jp/api/fcio.cgi"
    end
    expect(Cuenote::Api.config.endpoint).to eq "https://moge.asp.cuenote.jp/api/fcio.cgi"
  end

  it "changed config use equal" do
    Cuenote::Api.config.endpoint = "https://fuga.asp.cuenote.jp/api/fcio.cgi"
    expect(Cuenote::Api.config.endpoint).to eq "https://fuga.asp.cuenote.jp/api/fcio.cgi"
  end

  it "changed config with configure use equal" do
    Cuenote::Api.configure do |config|
      config.endpoint = "https://hage.asp.cuenote.jp/api/fcio.cgi"
    end
    expect(Cuenote::Api.config.endpoint).to eq "https://hage.asp.cuenote.jp/api/fcio.cgi"
  end
end

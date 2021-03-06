describe "get address" do
  before do
    Cuenote::Api.configure do |config|
      config.endpoint = ENV['CUENOTE_ENDPOINT']
      config.username = ENV['CUENOTE_USERNAME']
      config.password = ENV['CUENOTE_PASSWORD']
    end
    WebMock.disable!
  end

  after do
    WebMock.enable!
  end

  it "get address book" do
    books = Cuenote::Api::AddressBook.list
    book = books[0]

    expect(book).to be_a_kind_of Cuenote::Api::AddressBook

    import = book.import
    expect(import).to be_a_kind_of Cuenote::Api::Import
  end
end

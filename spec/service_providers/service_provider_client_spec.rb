require 'service_provider_client'
require 'service_providers/pact_helper'

describe ServiceProviderClient, :pact => true do

  before do
    ServiceProviderClient.base_uri 'localhost:1234'
  end

  subject { ServiceProviderClient.new }

  describe "#get" do

    before do
      service_provider
      .given('a product is created')
      .with(method: :get, path: '/products/1')
      .will_respond_with(
        status: 200,
        headers: {'Content-Type' => 'application/json'},
        body: {name: 'Book'} )
    end

    it "should get the book with correct name" do
      expect(subject.get(1)['name']).to eq('Book')
    end
  end
end

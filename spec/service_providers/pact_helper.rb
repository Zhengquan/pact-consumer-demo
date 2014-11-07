require 'pact/consumer/rspec'

Pact.service_consumer "Service Consumer" do
  has_pact_with "Service Provider" do
    mock_service :service_provider do
      port 1234
    end
  end
end

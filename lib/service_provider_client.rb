require 'httparty'

class ServiceProviderClient
 include HTTParty
  base_uri 'http://my-service'

  def get id
    JSON.parse(self.class.get("/products/#{id}").body)
  end
end

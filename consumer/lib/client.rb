require 'httparty'
require 'uri'
require 'json'

class Client

  attr_accessor :base_uri

  def initialize(uri = 'localhost:9292')
    @base_uri = uri
  end

  def load_provider_json
    response = HTTParty.get(URI::encode("http://#{base_uri}/provider.json?valid_date=" + Time.now.httpdate))
    if response.success?
      JSON.parse(response.body)
    end
  end

end

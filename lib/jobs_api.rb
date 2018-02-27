require 'httparty'

class JobsApi
  API_URL = 'https://enigmatic-meadow-90199.herokuapp.com/'

  def data_url
    response = HTTParty.get(API_URL)
    json = JSON.parse(response.body)
  end
end
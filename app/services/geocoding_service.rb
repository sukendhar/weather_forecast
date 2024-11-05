class GeocodingService
  include HTTParty
  base_uri 'https://api.opencagedata.com/geocode/v1'

  def initialize(api_key)
    @api_key = api_key
  end

  # Fetch coordinates by passing given address
  def fetch_coordinates(address)
    response = self.class.get('/json', query: { q: address, key: @api_key })

    data = response.parsed_response['results']&.first
    if data
      {
        latitude: data['geometry']['lat'],
        longitude: data['geometry']['lng'],
        zip_code: data.dig('components', 'postcode')
      }
    end
  end
end
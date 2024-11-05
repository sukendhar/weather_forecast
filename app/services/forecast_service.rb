class ForecastService
  include HTTParty
  base_uri 'https://api.openweathermap.org/data/2.5'

  def initialize(api_key)
    @api_key = api_key
  end

  # Fetch coordinates using latitude and longitude by calling openweathermap API
  def fetch_weather_by_coordinates(lat, long)
    self.class.get('/weather', query: { lat: lat, lon: long, appid: @api_key, units: 'metric' })
  end
end
require 'rails_helper'

RSpec.describe ForecastService, type: :service do
  it 'retrieves weather data for given coordinates' do
    service = ForecastService.new(ENV['WEATHER_API_KEY'])
    result = service.fetch_weather_by_coordinates(37.7749, -122.4194)
    expect(result.parsed_response).to have_key('main')
    expect(result.parsed_response['main']).to have_key('temp')
  end
end
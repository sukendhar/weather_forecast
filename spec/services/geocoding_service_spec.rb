require 'rails_helper'

RSpec.describe GeocodingService, type: :service do
  it 'retrieve log, lat coordinates for address' do
    service = GeocodingService.new(ENV['GEO_API_KEY'])
    result = service.fetch_coordinates('14001 AveryRanch, Austin, TX, United States')
    expect(result).to have_key(:latitude)
    expect(result).to have_key(:longitude)
    expect(result).to have_key(:zip_code)
  end
end
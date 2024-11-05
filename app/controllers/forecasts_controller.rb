class ForecastsController < ApplicationController
  def new

  end

  def create
    address = forecast_params[:address]

    # Initialize the Geocoding service
    geocoding_service = GeocodingService.new(ENV['GEO_API_KEY'])

    # Get the coordinates for the give address
    location = geocoding_service.fetch_coordinates(address)

    # if coordinates are present fetch weather by calling ForecastService with latitude and longitude
    if location
      @forecast = ForecastService.new(ENV['WEATHER_API_KEY']).fetch_weather_by_coordinates(location[:latitude], location[:longitude])
      render :show
    else
      flash[:alert] = "Unable to find the location for the provided address."
      render :new
    end
  end

  def show

  end

  private

  # Whitelist address params which is passed from new form
  def forecast_params
    params.require(:forecast).permit(:address)
  end
end

class ForecastsController < ApplicationController
  def new

  end

  def create
    address = params[:address]

    # Initialize the Geocoding service
    geocoding_service = GeocodingService.new(ENV['GEO_API_KEY'])

    # Get the coordinates for the give address
    location = geocoding_service.fetch_coordinates(address)

    # if coordinates are present fetch weather by calling ForecastService with latitude and longitude
    if location
      # Cache the forecast based on zipcode and expire in 30 minutes
      @forecast = Rails.cache.fetch("forecast_#{location[:zip_code]}", expires_in: 30.minutes) do
        ForecastService.new(ENV['WEATHER_API_KEY']).fetch_weather_by_coordinates(location[:latitude], location[:longitude])
      end
    @cached = Rails.cache.exist?("forecast_#{location[:zip_code]}")
    redirect_to forecast_path(zip_code: location[:zip_code])
    else
      flash[:alert] = "Unable to find the location for the provided address."
      render :new
    end
  end

  def show
    @forecast = Rails.cache.read("forecast_#{params[:zip_code]}")
    @cached = @forecast.present?
    if @forecast.nil?
      flash[:alert] = "Weather data is not available. Please try again."
      redirect_to new_forecast_path
    end
  end

  private

  # Whitelist address params which is passed from new form
  def forecast_params
    params.permit(:address)
  end
end

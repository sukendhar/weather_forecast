# README

This application allows users to retrieve the current weather forecast by entering an address. The app converts the address to coordinates using OpenCageData API, fetches weather data based on these coordinates, and displays the forecast details from OpenWeatherMap API. Caching is implemented to store weather data by zip code for 30 minutes, enhancing efficiency by avoiding repeated API requests.

## Requirements

- Ruby (version 3.0.0 or higher)
- Rails (version 7.0 or higher)
- An API key from:
    - [OpenWeatherMap API](https://openweathermap.org/api) for weather data.
    - [OpenCage Geocoding API](https://opencagedata.com/api) for address-to-coordinates conversion.
## Setup

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/weather_forecast_app.git
   cd weather_forecast_app

2. **Install Dependencies**: Run the following command to install the necessary gems:
    ```bash
   bundle install

3. Setup Environment Variables
    ```bash
   touch .env
   ```
    Add the following lines to .env, replacing the placeholders with your actual API keys:
    ```bash
    WEATHER_API_KEY=your_openweathermap_api_key
    GEO_API_KEY=your_opencage_api_key
    ```
4. Start the Server
    ```bash
    rails server
   ```
    
    Visit http://localhost:3000 to view the application   

## Testing

Run tests
```bash
bundle exec rspec 
```
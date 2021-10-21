# frozen_string_literal: true

require 'net/http'
require 'json'

module RequestWeather
  API_KEY = ENV['OPENWEATHERAPIKEY']

  TOWN_LONGITUDE = 49.39
  TOWN_LATITUDE = 58.36

  LINK = 'https://api.openweathermap.org/data/2.5/onecall'
  EXCLUDE = 'minutely'

  def self.gets_data
    uri = URI(LINK)
    params = { lat: TOWN_LATITUDE, lon: TOWN_LONGITUDE, units: 'metric',
               exclude: EXCLUDE, appid: API_KEY }
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
    JSON.parse(res.body)
  end
end

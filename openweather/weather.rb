# frozen_string_literal: true

require_relative 'lib/access_to_inicators'
require_relative 'lib/convertor'
require_relative 'lib/requestweather'

class Task
  include AccessToIndicators
  attr_reader :data

  def initialize
    @data = RequestWeather.gets_data
  end

  def gets_day_with_min_diff_feeling_from_real_in_night
    answer = data_daily_dif_temperature(@data)
    days, diff_temperature = answer[:days], answer[:diff_temperature]
    "#{Convertor.many_date_from_unix(days)} числа разница между ночной температурой и её ощущением будет минимальна в ближайщие 5 дней: #{diff_temperature } градуса по Цельсию"
  end

  def gets_day_with_max_light
    answer = data_daily_light(@data)
    daylight_minutes, days = answer[:daylight_minutes], answer[:days]
    "Самые длинные дни: #{Convertor.many_date_from_unix(days)}. Длительность: #{daylight_minutes.round(2)} минут"
  end
end

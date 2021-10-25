# frozen_string_literal: true
require_relative 'convertor'

module AccessToIndicators
  def data_daily_dif_temperature (data)
    acc = []
    fiveday = gets_temperature_five_night(data)
    fiveday.each_pair do |key, value|
      acc.push(key) if value == (fiveday.values.min)
    end
    {days: acc, diff_tempeture: fiveday.values.min}
  end

  def gets_temperature_five_night(data)
    data_daily_dif = {}
    data['daily'].take(5).each do |day|
      data_daily_dif[(day['dt'])] =
        (day['temp']['night'] - day['feels_like']['night']).abs
    end
    data_daily_dif
  end



  def data_daily_light(data)
    data_daily_dif = {}
    acc = []
    data['daily'].take(5).each do |day|
      data_daily_dif[(day['dt'])] =
      (Convertor.data_from_unix(day['sunset']) - Convertor.data_from_unix(day['sunrise'])).abs
    end
    data_daily_dif.each_pair do |key, value|
      acc.push(key) if value == (data_daily_dif.values.max)
    end
    {days: acc, daylight_minutes: (data_daily_dif.values.max/60.0)}
  end


  def gets_days(data)
    acc = []
    data['daily'].each { |day| acc << day['dt'] }
    acc
  end

  def current_day(data)
    data['current']['dt']
  end
end
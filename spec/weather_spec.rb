require './spec/spec_helper.rb'
require './openweather/weather.rb'

RSpec.describe do
  let(:data) { Task.new }
  context 'should return the text ' do
    it 'with the longest day', :vcr => 'open_weather' do
      expect(data.gets_day_with_max_light).to eq('Самые длинные дни: 25/10/2021. Длительность: 570.6 минут')
    end
    it 'should return the text with the day with the smallest difference in perceived and real temperatures ', :vcr => 'open_weather' do
      expected_output = '29/10/2021 числа разница между ночной температурой и её ощущением будет минимальна в ближайщие 5 дней: 0.0 градуса по Цельсию'
      expect(data.gets_day_with_min_diff_feeling_from_real_in_night).to eq(expected_output)
    end
  end
  context 'should return the hash with values' do
    it 'difference temperature', :vcr => 'open_weather' do
      expect(data.data_daily_dif_temperature(data.data)).to eq({ :days => [1635494400], :diff_temperature => 0.0 })
    end
    it 'longest days', :vcr => 'open_weather' do
      expect(data.data_daily_dif_temperature (data.data)).to eq({ :days => [1635494400], :diff_temperature => 0.0 })
    end
  end
end
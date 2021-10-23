require './spec/spec_helper.rb'
require './currency.rb'

RSpec.describe 'Converting courses' do
  it 'return the exchange rate of the NOK to the HUF', :vcr => 'courses_CBR' do
    huf = BigDecimal ('0.226966')
    nok = BigDecimal('8.50178')
    expect(TaskConvertor.new.course).to eq(nok/huf)
  end
end
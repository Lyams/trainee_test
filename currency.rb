require 'nokogiri'
require 'open-uri'
require 'bigdecimal'

class TaskConvertor
  #extend self
  URL = 'http://www.cbr.ru/scripts/XML_daily.asp'

  attr_reader :course

  def initialize
    data = gets_data
    data.css('Valute').each do |el|
      if 'HUF' == el.css('CharCode').text
      then
        @huf_courses = standardization(el)
      elsif 'NOK' == el.css('CharCode').text
      then
        @nok_courses = standardization(el)
      end
    end
    begin
      @course = @nok_courses / @huf_courses
    rescue
      puts 'Ошибка получения данных'
    end
  end

  def print_course
    puts "Курс одной норвежской кроны в венгерских форинтах: #{(@course).to_s('F')}"
  end

  private

  def standardization(el)
    BigDecimal(el.css('Value').text.gsub(',', '.')) /
      BigDecimal((el.css('Nominal').text.gsub(',', '.')))
  end

  def gets_data
    response = URI.open(URL).read
    Nokogiri::XML(response)
  end
end
# Ниже пример использования класса с выводом значения на устрйоство вывода.
#TaskConvertor.new.print_course

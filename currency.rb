require 'nokogiri'
require 'open-uri'
require 'bigdecimal'

def get_courses(d)
  d.css('Valute').each do |el|
    if 'HUF' == el.css('CharCode').text
      then @huf_courses = BigDecimal(el.css('Value').text.gsub(',', '.')) /
                  BigDecimal((el.css('Nominal').text.gsub(',', '.')))
    elsif 'NOK' == el.css('CharCode').text
      then @nok_courses = BigDecimal(el.css('Value').text.gsub(',', '.')) /
                  BigDecimal((el.css('Nominal').text.gsub(',', '.')))
    end
  end
end

url = 'http://www.cbr.ru/scripts/XML_daily.asp'
response = URI.open(url).read
xml_doc = Nokogiri::XML(response)
get_courses(xml_doc)

if @huf_courses && @nok_courses
  puts "Курс одной норвежской кроны в венгерских форинтах: #{(@nok_courses/@huf_courses).to_s('F')}"
else
  puts 'Ошибка получения данных'
end

require 'time'

module Convertor
  def self.data_from_unix(date)
    Time.strptime(date.to_s, '%s')
  end

  def self.many_date_from_unix(arr_date)
    arr_date.map{ |date| (data_from_unix(date)).strftime("%d/%m/%Y")  }.join(', ')
  end

end
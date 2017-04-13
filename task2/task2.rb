require 'mechanize'

agent = Mechanize.new
page = agent.get('https://www.raiffeisen.ru/ru/currency_rates')
puts page.title
puts page.at('div.switcher_view:nth-child(3) > h4:nth-child(2)').text.strip # текущий день
puts 'Покупка USD ' + page.at('div.switcher_view:nth-child(3) > table:nth-child(3) > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(4)').text
puts 'Продажа USD ' + page.at('div.switcher_view:nth-child(3) > table:nth-child(3) > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(5)').text

print "Введите значение: \n"
usd = gets
temp = page.at('div.switcher_view:nth-child(3) > table:nth-child(3) > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(4)').text
rub = (temp.to_f * usd.to_f)
puts rub

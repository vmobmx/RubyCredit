
def usdToRub(course, currency)
  return currency * course
end

def rubToUsd(course, currency)
  return currency / course
end

puts "Какая у вас на руках валюта?\n1. Рубли\n2. Доллары"
choice = gets.to_i

course = 0.0
currency = 0.0

if (choice == 1) 
  puts "Сколько стоит 1 доллар?"
  course = gets.to_f
  puts "Сколько у вас рублей?"
  currency = gets.to_f
  puts "Ваши запасы на сегодня равны: #{rubToUsd(course, currency)} $"
else 
  puts "Сколько стоит 1 доллар?"
  course = gets.to_f
  puts "Сколько у вас долларов?"
  currency = gets.to_f
  puts "Ваши запасы на сегодня равны: #{usdToRub(course, currency)} руб."
end
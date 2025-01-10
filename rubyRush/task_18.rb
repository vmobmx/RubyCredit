puts "Сколько стоит 1 доллар в рублях?"
course = gets.to_f
puts "Сколько у вас рублей?"
currencyInRUB = gets.to_f

currencyInUSD = currencyInRUB / course

abort "Ваши запасы равны $ #{currencyInUSD}"


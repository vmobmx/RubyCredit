cars = ["Tesla", "Toyota", "Ford", "Honda", "BMW", "Subaru", "Hyundai", "Audi", "Jeep"]

puts "У нас всего " + cars.count.to_s + " машин. Вам какую?"
choice = gets.to_i - 1

if (choice < 0 || choice + 1 > cars.count)
  puts "Извините, машины с таким номером у нас нет :("
else
  puts "Поздравляем! Вы получили " + cars[choice].to_s
end
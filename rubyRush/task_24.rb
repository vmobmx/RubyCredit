a = [1, 2, 3, 4, 5]

puts "Исходынй массив:\n" + a.to_s + "\nМассив в обратном порядке:\n" + a.reverse.to_s

puts "Исходный массив(не изменился):\n" + a.to_s
a.reverse!
puts "Исходный массив(после изменения):\n" + a.to_s


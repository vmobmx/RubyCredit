number = rand(16) + 1

puts "Загадано число от 0 до 16, отгадайте какое?"

answer = gets.to_i
while (answer != number) 
  if (answer > number) 
    puts "Тепло (нужно меньше)"
  else
    puts "Тепло (нужно больше)"
  end
  answer = gets.to_i
end

puts "Ура, вы выиграли!"
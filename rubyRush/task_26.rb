bumagas = ["камень", "ножницы", "бумага"]

puts "Введите вариант: 0 - камень, 1 - ножницы, 2 - бумага"

choice = gets.to_i
choicePC = rand(3)

whoWin = 0 # if 0 - user win, if 1 - pc win
 
if (choice == 0) 
  if (choicePC == 2)
    whoWin = 1
  end
elsif (choice == 1)
  if (choicePC == 0)
    whoWin = 1
  end
elsif (choicePC == 1)
  whoWin = 1;
end

puts "Вы выбрали: " + bumagas[choice]
puts "Компьютер выбрал: " + bumagas[choicePC]

if (whoWin == 0) 
  puts "Вы победили"
else
  puts "Победил компьютер"
end

puts "Вы в бассейне. Куда плыть?\n1. На дно\n2. К лесенке\n3. К девушке "

choice = gets.to_i

if (choice == 1)
  abort "Вы утонули..."
elsif (choice == 2) 
  abort "Вас столкнули и вы утонули"
else
  abort "Она уплыла к другому и вы поплыли на дно"
end


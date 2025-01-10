time = Time.now
wday = time.wday

if (wday == 0 || wday == 6) 
  puts "Сегодня выходной!"
else
  puts "Сегодня будний день, за работу!"
end

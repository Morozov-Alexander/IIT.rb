a = {'a' => 1 , 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5, 'f' => 6, 'g' => 7, 'h' => 8}

puts("Вначале вводи букву а потом цифру(координаты доски для шахмат) \nи так для двух клеток!!!")

Geter1 =a[gets.chomp.downcase]
FirstPole = gets.chomp.to_i;
Geter2 =a[gets.chomp.downcase]
TheSecondPole = gets.chomp.to_i

if !Geter1 || !Geter2 || !FirstPole.between?(1,8) || !TheSecondPole.between?(1,8)
puts "Няма таких симвалау!!! \nТольки {a,b,c,d,e,f,g,h\nAnd numbers between(1..8)}!" ; return
end  

A =(FirstPole - TheSecondPole)
B = (Geter1-Geter2)
  
if A.abs + B.abs == 3
     puts "Конь доскачет!!"
     
    else
       puts "Конь недоскачет!!"
    end
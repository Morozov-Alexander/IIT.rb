#Даны координаты двух полей шахматной доски. Необходимо определить, может ли конь добраться из одного поля в другое за один ход.
array = {'a' => 1 , 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5, 'f' => 6, 'g' => 7, 'h' => 8}

puts("Вначале вводи букву , а потом цифру(координаты доски для шахмат) \nи так для двух клеток!!!")

geter1 =array[gets.chomp.downcase]
first_pole = gets.chomp.to_i;
geter2 =array[gets.chomp.downcase]
the_second_pole = gets.chomp.to_i

if !geter1 || !geter2 || !first_pole.between?(1,8) || !the_second_pole.between?(1,8)
puts "Няма таких симвалау!!! \nТольки {a,b,c,d,e,f,g,h\nAnd numbers between(1..8)}!" ; return
end  

a =(first_pole - the_second_pole)
b = (geter1-geter2)
  
  if a.abs + b.abs == 3 &&  geter2 != geter1  && the_second_pole != first_pole
     puts "Конь доскачет!!"
   else
      puts "Конь недоскачет!!"
  end

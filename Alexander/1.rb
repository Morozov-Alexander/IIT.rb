#Сдвинуть элемент массива вправо на количество, равное его индексу. Размер массива не должен меняться, а количество сдвигов равно количеству элементов массива 
array= []
(5 + rand(15)).times{ |i| array.push(i+1)}

puts "Надо ввести номер элемента , по индексу которого будет сдвиг.\nРазмер массива = #{array.size} "
indeks = (gets.chomp.to_i)

if !indeks.between?(1,array.size)
puts "No, out of bounds array!!!"; return
end	

puts (array.to_s + "---Начальный массив.")

array.shift((indeks - array.size-1).abs).each{|i| array.push(i)}
puts (array.to_s + "---Массив после сдвига." )

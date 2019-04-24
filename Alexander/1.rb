 array= []
(5 + rand(15)).times{ |i| array.push(i+1)}

puts "Надо ввести номер элемента , по индексу которого будет сдвиг./n Размер массива =#{array.size} "
indeks = (gets.chomp.to_i)

puts (array.to_s + "---Начальный массив.")

array.shift((indeks - array.size-1).abs).each{|i| array.push(i)} 
puts (array.to_s + "---Массив после сдвига." )
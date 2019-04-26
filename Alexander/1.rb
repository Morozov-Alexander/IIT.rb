#Сдвинуть элемент массива вправо на количество, равное его индексу. Размер массива не должен меняться, а количество сдвигов равно количеству элементов массива
array = []
(5 + rand(15)).times{ |i| array.push(i + 1) }
puts "Надо ввести номер элемента, по индексу которого будет сдвиг\n Размер массива = #{ array.size }"
index = gets.chomp.to_i
if !index.between?(1, array.size)
  p "No, out of bounds array!!!"
  return
end
p array.to_s + "---Начальный массив"
array.shift((index - array.size - 1).abs).each { |i| array.push(i) }
p array.to_s + "---Массив после сдвига"

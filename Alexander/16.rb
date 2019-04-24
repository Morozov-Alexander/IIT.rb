#Понять местами ключ-значения в хэше.
array = {}
 (1..10).each {|i| array[i] = rand(100)}

puts array.to_s + "---Было"
array =array.invert
puts array.to_s + "---Стало"

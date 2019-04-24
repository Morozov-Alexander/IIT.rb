array = {}
 (1..10).each do 
 |i|
 array[i] = rand(100)
end

puts array
array =array.invert
p array

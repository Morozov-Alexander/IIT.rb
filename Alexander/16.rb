#Понять местами ключ-значения в хэше.
hash = {}
(1..10).each { |i| hash[i] = rand(100) }
p hash.to_s + "-Было"
p hash.invert.to_s + "-Стало"

#In this task i use gem - "colorize"
#Дан массив в котором находятся строки "белый", "синий" и "красный" в случайном порядке. Необходимо упорядочить массив так, чтобы получился украинский флаг.
# It is all that i can come up  with me broken brain. Moreover why not , Ukrainian - Yes!  
require 'colorize'
array = ["красный","синий","белый"]
array.shuffle!
puts array[0].light_yellow  
puts array[1].blue 



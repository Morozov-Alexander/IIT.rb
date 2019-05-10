# ---
# - !ruby/object:Person
#   name: Alexander
#   sname: Morozov
#   email: 1@gmail.com
# - !ruby/object:Person
#   name: Maksim
#   sname: Shitsko
#   email: 2@mail.ru
# - !ruby/object:Kat
#   name: kat
#   age: 3

require 'yaml'

class Person
 attr_accessor :name, :sname, :email
end
class Kat
 attr_accessor :name, :age
end
data = YAML.load(File.open('1.yml'))
puts data[1].name #=> 'Maksim'
puts data[2].age #=> '3'
puts data[0].sname #=> 'Morozov'
p data #=>[#<Person:0x00000000023221f0 @name="Alexander", @sname="Morozov", @email="1@gmail.com">,
           #<Person:0x0000000002321278 @name="Maksim", @sname="Shitsko", @email="2@mail.ru">,
           #<Kat:0x0000000002320b70 @name="kat", @age=3>]
hash = {1 => '1', 2 => '2', 3 => '3'}
File.open('2.txt', 'w') { |f| f.write(hash.to_yaml) }
hash = YAML.load_file('2.txt')
p hash

array = [1, 2, 3]
File.open('2.txt', 'w') { |f| f.write(array.to_yaml) }
array = YAML.load_file('2.txt')
p array

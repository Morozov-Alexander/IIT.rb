def checkup (number, letter)
  flag = true

  if !letter || !number.between?(1,8)
    puts "Няма таких симвалау!!!\nТольки {a, b, c, d, e, f, g, h}\nAnd numbers between(1..8)\nДаю еще попытку!"
    flag = false
  end

  flag
end
def wright
  replacement_array = {'a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5, 'f' => 6, 'g' => 7, 'h' => 8}
  puts 'Введиди Букву, а потом Цифру (координаты клетки)!'
  letter = replacement_array[gets.chomp.downcase]
  number = gets.chomp.to_i
  [letter, number]
end

class Board
  @@hash =
      { [1,1] => [1, 'w','Rook'],[1,2] => [1, 'w','kNight'],[1,3] => [1, 'w','Bishop'],[1,4] => [1, 'w','King'],[1,5] => [1, 'w','Queen'],[1,6] => [1, 'w','Bishop'],[1,7] => [1, 'w','kNight'],[1,8] => [1, 'w','Rook'],
        [2,1] => [1, 'w','Pawn'],[2,2] => [1, 'w','Pawn'],[2,3] => [1, 'w','Pawn'],[2,4] => [1, 'w','Pawn'],[2,5] => [1, 'w','Pawn'],[2,6] => [1, 'w','Pawn'],[2,7] => [1, 'w','Pawn'],[2,8] => [1, 'w','Pawn'],
        [3,1] => [0, ' ',' '],[3,2] => [0, ' ',' '],[3,3] => [0, ' ',' '],[3,4] => [0, ' ',' '],[3,5] => [0, ' ',' '],[3,6] => [0, ' ',' '],[3,7] => [0, ' ',' '],[3,8] => [0, ' ',' '],
        [4,1] => [0, ' ',' '],[4,2] => [0, ' ',' '],[4,3] => [0, ' ',' '],[4,4] => [0, ' ',' '],[4,5] => [0, ' ',' '],[4,6] => [0, ' ',' '],[4,7] => [0, ' ',' '],[4,8] => [0, ' ',' '],
        [5,1] => [0, ' ',' '],[5,2] => [0, ' ',' '],[5,3] => [0, ' ',' '],[5,4] => [0, ' ',' '],[5,5] => [0, ' ',' '],[5,6] => [0, ' ',' '],[5,7] => [0, ' ',' '],[5,8] => [0, ' ',' '],
        [6,1] => [0, ' ',' '],[6,2] => [0, ' ',' '],[6,3] => [0, ' ',' '],[6,4] => [0, ' ',' '],[6,5] => [0, ' ',' '],[6,6] => [0, ' ',' '],[6,7] => [0, ' ',' '],[6,8] => [0, ' ',' '],
        [7,1] => [0, ' ',' '],[7,2] => [0, ' ',' '],[7,3] => [0, ' ',' '],[7,4] => [0, ' ',' '],[5,5] => [0, ' ',' '],[5,6] => [0, ' ',' '],[5,7] => [0, ' ',' '],[5,8] => [0, ' ',' '],
        [6,1] => [0, ' ',' '],[6,2] => [0, ' ',' '],[6,3] => [0, ' ',' '],[6,4] => [0, ' ',' '],[6,5] => [0, ' ',' '],[6,6] => [0, ' ',' '],[6,7] => [0, ' ',' '],[6,8] => [0, ' ',' '],
        [7,1] => [1, 'b','Pawn'],[7,2] => [1, 'b','Pawn'],[7,3] => [1, 'b','Pawn'],[7,4] => [1, 'b','Pawn'],[7,5] => [1, 'b','Pawn'],[7,6] => [1, 'b','Pawn'],[7,7] => [1, 'b','Pawn'],[7,8] => [1, 'b','Pawn'],
        [8,1] => [1, 'b','Rook'],[8,2] => [1, 'b','kNight'],[8,3] => [1, 'b','Bishop'],[8,4] => [1, 'b','King'],[8,5] => [1, 'b','Queen'],[8,6] => [1, 'b','Bishop'],[8,7] => [1, 'b','kNight'],[8,8] => [1, 'b','Rook'],}

end

class Move < Board

  def find_figure (coordinates)
    puts show_the_figure(@array = @@hash[coordinates].flatten)
  end

  def show_the_figure (array)
    puts array[0] == 1 ? "It is a #{array[2]}\nWhat do you want to do ?" : 'Empty cell!!'
  end

  def check (color_of_move)
   color_of_move == @array[1] ? true : false
  end

  def sexism (name, names, coordinates)
    print "Так как ты #{name}!!!! "
    if  names.find_all { |index| index == name  }.size > 0
      puts 'То Я, как хозяин , даю тебе второй шанс!!!'
      coordinates = wright
    else
      puts "То ты пропускаешь свой ход!!!!!!\nWhy - Mb you want to say ?\nI will answer you - Cause I mogu)"
    end
    coordinates
  end

end

class Player < Move
attr_reader :name
@@names = %w[ maksim sasha alex alexander max kirill maks sanya поц man root sudo admin я саша максим саня кирилл александр хозяин макс]
   def initialize(name)
     @name = name
   end

   def begin(coordinates, color_of_move)

      find_figure(coordinates)
      if !check(color_of_move)
        puts "Шо ты творишь, #{@name} !!!\nКто тебе разрешил это трогать ?"
        coordinates = sexism(@name , @@names , coordinates)
      end
puts "To be continued ......"
   end

end

flag = true
color_of_move  = 'w'
puts 'First of all wright your names !!!'
Sasha = Player.new(gets.chomp.to_s)
Tanya = Player.new(gets.chomp.to_s)

while flag
 puts color_of_move == 'w' ? "Сейчас ходит #{Sasha.name}" : "Сейчас ходит #{Tanya.name}"
  coordinates = wright
  next if !checkup(coordinates[0], coordinates[1])

  if color_of_move == 'w'
    Sasha.begin(coordinates, color_of_move)
    color_of_move = 'b'
  else
    Tanya.begin(coordinates, color_of_move)
    color_of_move = 'w'
  end

  puts 'exit'
  exit = gets.chomp.to_i
  if (exit == 0)
    return
  end


end

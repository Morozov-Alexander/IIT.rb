require 'colorize'
def checkup (number, letter)
  flag = true
  if !letter || !number.between?(1,8)
    puts "Няма таких симвалау!!!\nТольки {a, b, c, d, e, f, g, h}\nAnd numbers between(1..8)\nДаю еще попытку!"
    flag = false
  end
  flag
end

def wright
  flag = false
  while !flag
    replacement_array = {'a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5, 'f' => 6, 'g' => 7, 'h' => 8}
    puts 'Введиди Букву, а потом Цифру (координаты клетки)!'
    letter = replacement_array[gets.chomp.downcase]
    number = gets.chomp.to_i
    flag = checkup(number, letter)
  end
  [letter, number]
end
module Function
  attr_reader :color , :picture
  attr_accessor :array_of_possible_movies
  def show
    print color == "White" ? picture.white.green : picture.black.yellow
  end
end

class King
include Function
  def initialize(color)
    @color = color
    @picture = '♚'
  end
end

class Queen
include Function
  def initialize(color)
    @color = color
    @picture= '♛'
  end
end

class Rook
include Function
  def initialize(color)
    @color = color
    @picture = '♜'
  end
end

class Bishop
include Function
  def initialize(color)
    @color = color
    @picture = '♝'
  end
end

class Knight
include Function
  def initialize(color)
    @color = color
    @picture = '♞'
  end
end

class Pawn
  include Function
  @move = false
  def initialize(color)
    @color = color
    @picture = '♟'
  end

  def possible_moves(coordinates , coordinates_of_move)
  if coordinates - coordinates_of_move
  end

end
class Empty
  @@picture = ' '

  def show_black
    print @@picture.on_black
  end

  def show_white
    print @@picture.on_white
  end
end

class Board
  @@empty = Empty.new
  @@hash =
      { [1,1] => Rook.new('White'),[1,2] => Knight.new('White'),[1,3] => Bishop.new('White'),[1,4] => King.new('White'),[1,5] => Queen.new('White'),[1,6] => Bishop.new('White'),[1,7] =>  Knight.new('White'),[1,8] => Rook.new('White'),
        [2,1] => Pawn.new('White'),[2,2] => Pawn.new('White'),[2,3] => Pawn.new('White'),[2,4] => Pawn.new('White'),[2,5] => Pawn.new('White'),[2,6] => Pawn.new('White'),[2,7] => Pawn.new('White'),[2,8] => Pawn.new('White'),
        [3,1] => 0,[3,2] => 0,[3,3] => 0,[3,4] => 0,[3,5] => 0,[3,6] => 0,[3,7] => 0,[3,8] => 0,
        [4,1] => 0,[4,2] => 0,[4,3] => 0,[4,4] => 0,[4,5] => 0,[4,6] => 0,[4,7] => 0,[4,8] => 0,
        [5,1] => 0,[5,2] => 0,[5,3] => 0,[5,4] => 0,[5,5] => 0,[5,6] => 0,[5,7] => 0,[5,8] => 0,
        [6,1] => 0,[6,2] => 0,[6,3] => 0,[6,4] => 0,[6,5] => 0,[6,6] => 0,[6,7] => 0,[6,8] => 0,
        [7,1] => 0,[7,2] => 0,[7,3] => 0,[7,4] => 0,[5,5] => 0,[5,6] => 0,[5,7] => 0,[5,8] => 0,
        [6,1] => 0,[6,2] => 0,[6,3] => 0,[6,4] => 0,[6,5] => 0,[6,6] => 0,[6,7] => 0,[6,8] => 0,
        [7,1] => Pawn.new('Black'),[7,2] => Pawn.new('Black'),[7,3] => Pawn.new('Black'),[7,4] => Pawn.new('Black'),[7,5] => Pawn.new('Black'),[7,6] => Pawn.new('Black'),[7,7] => Pawn.new('Black'),[7,8] => Pawn.new('Black'),
        [8,1] => Rook.new('Black'),[8,2] => Knight.new('Black'),[8,3] => Bishop.new('Black'),[8,4] => King.new('Black'),[8,5] => Queen.new('Black'),[8,6] => Bishop.new('Black'),[8,7] => Knight.new('Black'),[8,8] => Rook.new('Black')}

  def show
    for i in 1..8
      for j in 1..8
        if @@hash[[i,j]] != 0
          @@hash[[i,j ]].show
        elsif i % 2 == j % 2
          @@empty.show_black
        else
          @@empty.show_white
        end
      end
        puts "\n"
    end
  end

  def show_element(coordinates, color)

    @@flag = false
    while @@flag == false
      if check_the_figure(@@hash[coordinates].color, color) == true
          system "clear"
          print 'Вы выбрали - '
          @@hash[coordinates].show
          puts ""
        @@flag = true
      else
        puts 'Не тот цвет!!!'
        coordinates = wright
      end
    end

  end

  def check_the_figure(basic_color, color)
    color ==  basic_color ? true : false
  end

  def check_the_move(coordinates, coordinates_of_move)
@array_of_possible_movies = check_with_other_elements_of_hash (@@hash[coordinates].possible_moves(coordinates))
    if @array_of_possible_movies.include?(coordinates_of_move)
       @@hash[coordinates_of_move], @@hash[coordinates] = @@hash[coordinates], @@hash[coordinates_of_move]
       puts 'yes'
    else
      p @array_of_possible_movies
      p coordinates_of_move
        puts "nope"
    end
  end

  def check_with_other_elements_of_hash (array_of_possible_movies)
    @array_for_del = []
    array_of_possible_movies.each do |index|
      @@hash[index] != 0 ? @array_for_del << index : index
    end
    # # puts @array_for_del
    array_of_possible_movies
  end
end

class Player
  attr_reader :name
  @@names = %w[ maksim sasha alex alexander max kirill maks sanya поц man root sudo admin я саша максим саня кирилл александр хозяин макс]
  def initialize(name)
    @name = name
  end
end

flag = true
color_of_move  = 'White'
puts 'First of all wright your names !!!'

board = Board.new
Sasha = Player.new(gets.chomp.to_s)
Tanya = Player.new(gets.chomp.to_s)
system "clear"


while flag

  board.show
  puts color_of_move == 'White' ? "Сейчас ходит #{Sasha.name}" : "Сейчас ходит #{Tanya.name}"
  coordinates = wright
  board.show_element(coordinates, color_of_move)
  puts "Введи клетку , куда хочешь походить!!!"
  coordinates_of_move = wright
  board.check_the_move(coordinates, coordinates_of_move)
  # if color_of_move == 'White'
  #   color_of_move = 'Black'
  # else
  #
  #   color_of_move = 'White'
  # end
# system "clear"
end

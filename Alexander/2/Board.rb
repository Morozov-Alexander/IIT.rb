require_relative 'Game.rb'
class Board < Game
  attr_accessor :hash
  def initialize
    @cell = Cell.new
    @hash =
      { [1,1] => Rook.new('White'),[1,2] => Knight.new('White'),[1,3] => Bishop.new('White'),[1,4] => King.new('White'),[1,5] => Queen.new('White'),[1,6] => Bishop.new('White'),[1,7] =>  Knight.new('White'),[1,8] => Rook.new('White'),
        [2,1] => Pawn.new('White'),[2,2] => Pawn.new('White'),[2,3] => Pawn.new('White'),[2,4] => Pawn.new('White'),[2,5] => Pawn.new('White'),[2,6] => Pawn.new('White'),[2,7] => Pawn.new('White'),[2,8] => Pawn.new('White'),
        [3,1] => @cell,[3,2] => @cell,[3,3] => @cell,[3,4] => @cell,[3,5] => @cell,[3,6] => @cell,[3,7] => @cell,[3,8] => @cell,
        [4,1] => @cell,[4,2] => @cell,[4,3] => @cell,[4,4] => @cell,[4,5] => @cell,[4,6] => @cell,[4,7] => @cell,[4,8] => @cell,
        [5,1] => @cell,[5,2] => @cell,[5,3] => @cell,[5,4] => @cell,[5,5] => @cell,[5,6] => @cell,[5,7] => @cell,[5,8] => @cell,
        [6,1] => @cell,[6,2] => @cell,[6,3] => @cell,[6,4] => @cell,[6,5] => @cell,[6,6] => @cell,[6,7] => @cell,[6,8] => @cell,
        [7,1] => @cell,[7,2] => @cell,[7,3] => @cell,[7,4] => @cell,[5,5] => @cell,[5,6] => @cell,[5,7] => @cell,[5,8] => @cell,
        [6,1] => @cell,[6,2] => @cell,[6,3] => @cell,[6,4] => @cell,[6,5] => @cell,[6,6] => @cell,[6,7] => @cell,[6,8] => @cell,
        [7,1] => Pawn.new('Black'),[7,2] => Pawn.new('Black'),[7,3] => Pawn.new('Black'),[7,4] => Pawn.new('Black'),[7,5] => Pawn.new('Black'),[7,6] => Pawn.new('Black'),[7,7] => Pawn.new('Black'),[7,8] => Pawn.new('Black'),
        [8,1] => Rook.new('Black'),[8,2] => Knight.new('Black'),[8,3] => Bishop.new('Black'),[8,4] => King.new('Black'),[8,5] => Queen.new('Black'),[8,6] => Bishop.new('Black'),[8,7] => Knight.new('Black'),[8,8] => Rook.new('Black')}
  end
  def cell?(i, j)
     @hash[[i,j]].class == Cell ? true : false
  end
  def array_direction(color_of_move)
    color_of_move == 'White' ? [8, 7, 6, 5, 4, 3, 2, 1 ] : [1, 2, 3, 4, 5, 6, 7, 8]
  end
  def show(array_of_movies, color_of_move)
    array = array_direction(color_of_move)
    puts " |a b c d e f g h"
    array.each do |i|
      print i
      print "|"
      for j in 1..8
        check_the_blue_color(i, j, array_of_movies)
      end
      puts ''

    end
  end
  def show_element(coordinates, color, board)
    flag = true
    while flag

      if !cell?(coordinates[0], coordinates[1]) && the_same_color?(@hash[coordinates].color, color)
        system "clear"
        print 'Твой голубой вассал - '
        puts @hash[coordinates].show(true, coordinates)
        flag = false
      else
        puts 'Не торт, давай по новой!!!'
        coordinates = wright(board, color)
      end

    end
    coordinates
  end
  def check_the_blue_color(i, j, array_of_movies)
    array_of_movies.include?([i, j]) ? @hash[[i,j]].show(true, [i,j]) : @hash[[i,j]].show(false, [i,j])
  end
  def the_same_color?(basic_color, color)
    color == basic_color ? true : false
  end

  def figure?(temp_array, coordinates, array_of_movies)
    if cell?(temp_array[0], temp_array[1])
      true
    elsif the_same_color?(@hash[temp_array].color, @hash[coordinates].color) || (@hash[coordinates].class == Pawn && temp_array[1] == coordinates[1])
      false
    else
      array_of_movies << Marshal.load(Marshal.dump(temp_array))
      false
    end
  end

  def check_the_move(coordinates, coordinates_of_move, board)
    flag = false
    if @hash[coordinates].class == Pawn
      @hash[coordinates].move(coordinates, board, 'ne proverka')
    else
      @hash[coordinates].move(coordinates, board)
    end
    flag = hit_or_swap(coordinates, coordinates_of_move, board)
    flag
  end

  def hit_or_swap(coordinates, coordinates_of_move, board)
    if @hash[coordinates].array_of_movies.include?(coordinates_of_move)
      if cell?(coordinates_of_move[0], coordinates_of_move[1])
        @hash[coordinates], @hash[coordinates_of_move] = @hash[coordinates_of_move], @hash[coordinates]
      else
        if @hash[coordinates_of_move].class == King
          puts 'Game over!!!!!'
          puts 'Давай до свидания)'
          sleep(4)
          return true
        end
        @hash[coordinates_of_move] = @hash[coordinates]
        @hash[coordinates] = @empty
      end
    else
      system "clear"
      puts 'Nope!!!!'
      show(@hash[coordinates].array_of_movies, @hash[coordinates].color)
      puts 'Рекомендую голубую!!'
      puts '1 - другая фигура ; != 1 - другая клетка для насилия'
      if gets.chomp == '1'
        @hash[coordinates].first_move if @hash[coordinates].class == Pawn && (coordinates[0] == 2 || coordinates[0] == 7)
        show_the_new_board(board, @hash[coordinates].color)
        the_first(@hash[coordinates].color, board)
      else
         hit_or_swap(coordinates, wright(board, @hash[coordinates].color), board)
       end
    end
    false
  end

  def check_the_shah(coordinates, board)
    system "clear"
    color_of_move = 'White'
    (1..2).each do
      hit = []
      @array_of_all_possible_move =[]
      for i in 1..8
        for j in 1..8
          if @hash[[i,j]].class == Pawn
            @array_of_all_possible_move += @hash[[i,j]].move([i,j], board, 'proverka')
          elsif !cell?(i, j)
            @array_of_all_possible_move += @hash[[i,j]].move([i,j], board)
          end
        end
      end
      hit = @array_of_all_possible_move.find_all { |index| @hash[index].class == King && @hash[index].color != color_of_move }
      if hit != []
        puts "Твое мурчало под угрозой!!!! --- " + color_of_move + "---Наносит ответный удар!!!"
        puts 'Black => Green, White = Yellow'
        sleep(4)
      end
      hit = 0
      color_of_move = 'Black'
    end
  end

end

class Board
  attr_accessor :hash
  def initialize
    @@empty = Empty.new
    @hash =
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
  end
  def show(array_of_movies, color_of_move)
    puts " |a b c d e f g h"
    array = color_of_move == 'White' ? [8, 7, 6, 5, 4, 3, 2, 1 ] : [1, 2, 3, 4, 5, 6, 7, 8]
    array.each do |i|
      print i
      print "|"
      for j in 1..8
        if array_of_movies.include?([i,j])
          if @hash[[i,j]] != 0
            @hash[[i,j]].show(true, [i,j])
          else
            @@empty.show_blue
            @@empty.show_blue
          end
          next
        end
        if @hash[[i,j]] != 0
          @hash[[i,j ]].show(false, [i,j])
        elsif i % 2 == j % 2
          @@empty.show_black
          @@empty.show_black
        else
          @@empty.show_white
          @@empty.show_white
        end
      end
        puts ''
    end
  end

  def show_element(coordinates, color, board)
    flag = false
    while !flag
      if @hash[coordinates] != 0 && check_the_figure(@hash[coordinates].color, color)
        system "clear"
        print 'Вы выбрали - '
        puts @hash[coordinates].show(true, coordinates)
        puts ""
        flag = true
      else
        puts 'Не тот цвет!!!'
        coordinates = wright(board, color)
      end
    end
    coordinates
  end

  def check_the_figure(basic_color, color)
    color == basic_color ? true : false
  end

  public def figure?(temp_array, coordinates, array_of_movies)
   if @hash[temp_array] == 0
     true
   elsif @hash[temp_array].color == @hash[coordinates].color || (@hash[coordinates].class == Pawn && temp_array[1] == coordinates[1])
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
      if @hash[coordinates_of_move] == 0
        @hash[coordinates], @hash[coordinates_of_move] = @hash[coordinates_of_move], @hash[coordinates]
      else
        if @hash[coordinates_of_move].class == King
          puts 'Game over!!!!!'
          puts 'Давай до свидания)'
          sleep(4)
          return true
        end
        @hash[coordinates_of_move] = @hash[coordinates]
        @hash[coordinates] = 0
      end
    else
      system "clear"
      puts 'Nope!!!!'
      show(@hash[coordinates].array_of_movies, @hash[coordinates].color)
      puts 'Я, как маленький разрабатченок разрешаю тебе выбрать новую клетку, желательно голубую'
      puts '1 - другая фигура ; != 1 - другая клетка для битья '
      if gets.chomp == '1'
        @hash[coordinates].move = false if @hash[coordinates].class == Pawn && (coordinates[0] == 2 ||coordinates[0] == 7)
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
          elsif @hash[[i,j]] != 0
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

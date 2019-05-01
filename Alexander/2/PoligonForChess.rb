require 'colorize'

class BasicPiece
  attr_accessor :color
  attr_accessor :icon
  attr_accessor :type
end

class King < BasicPiece
  def initialize(color)
    @color = color
    @icon = '♚'
  end

  def is_this_move_possible?(go_to)
    return true
  end
end

class Queen < BasicPiece
  def initialize(color)
    @color = color
    @icon = '♛'
  end

  def is_this_move_possible?(go_to)
    return true
  end
end

class Rook < BasicPiece
  def initialize(color)
    @color = color
    @icon = '♜'
  end

  def is_this_move_possible?(go_to)
    return true
  end
end

class Bishop < BasicPiece
  def initialize(color)
    @color = color
    @icon = '♝'
  end

  def is_this_move_possible?(go_to)
    return true
  end
end

class Knight < BasicPiece
  def initialize(color)
    @color = color
    @icon = '♞'
  end

  def is_this_move_possible?(go_to)
    return true
  end
end

class Pawn < BasicPiece
  def initialize(color)
    @color = color
    @icon = '♟'
  end

  def is_this_move_possible?(go_to)
    return true
  end
end

class Board
  attr_accessor :grid
  def initialize
    @grid = [[Rook.new('Black'), Knight.new('Black'), Bishop.new('Black'), King.new('Black'), Queen.new('Black'), Bishop.new('Black'), Knight.new('Black'), Rook.new('Black')], [Pawn.new('Black'), Pawn.new('Black'), Pawn.new('Black'), Pawn.new('Black'), Pawn.new('Black'), Pawn.new('Black'), Pawn.new('Black'), Pawn.new('Black')], [0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0], [Pawn.new('White'), Pawn.new('White'), Pawn.new('White'), Pawn.new('White'), Pawn.new('White'), Pawn.new('White'), Pawn.new('White'), Pawn.new('White')], [Rook.new('White'), Knight.new('White'), Bishop.new('White'), King.new('White'), Queen.new('White'), Bishop.new('White'), Knight.new('White'), Rook.new('White')]]
  end

  def render_the_board
    self.grid.each do |row|
      row.each do |piece|
        if piece != 0
          if piece.color == 'White'
            print piece.icon + ' '
          else
            print piece.icon.blue + ' '
          end
        else
          print " "
        end
      end
      puts " "
    end
  end

  def move(piece, go_to)
    if piece.is_this_move_possible(go_to)

    else

    end
  end
end

board = Board.new
end_of_game = false

while !end_of_game
  system "clear"
  piece_cell = []
  destination_cell = []
  board.render_the_board
board.grid[1,1] ,board.grid[2,4]  = board.grid[2,4] , board.grid[1,1]
   board.render_the_board
  puts 'Which piece to move: '
  piece_cell.push(gets.chomp.to_i)
  piece_cell.push(gets.chomp.to_i)

  ((piece_cell[0] < 7) && (piece_cell[1] < 7) && (board.grid[piece_cell[0] - 1][piece_cell[1] - 1] != 0)) ? (p piece_cell) : (next)

  puts 'Whre to move it: '
  destination_cell.push(gets.chomp.to_i)
  destination_cell.push(gets.chomp.to_i)
  p destination_cell
end
#
# Foo = :problem
#
# module A
#   Foo = 42
#   # looks up A::Foo because of lexical scope
#   module B
#
#     def self.foo
#       Foo
#     end
#
#   end
# end
#
# # looks up ::Foo because of lexical scope
# module A::C
#   def self.foo
#     Foo
#   end
# end
#
# # Looks up A::Foo, fully qualified ... ok technically ::A::Foo is fully qualified, but meh.
# module A::D
#   def self.foo
#     A::Foo
#   end
# end
#
#  p A::B.foo # => 42
#  p A::C.foo # => :problem
# p A::D.foo # => 42

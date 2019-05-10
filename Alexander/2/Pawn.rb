require_relative 'Figure.rb'
class Pawn < Figure
  def initialize(color)
    @move = false
    @color = color
    @picture = '♟'
  end

  def move(coordinates, board, proverka)
    @move == false ? @limit = 2 : @limit = 1
    @move = true if proverka != 'proverka'
    if @color == 'White'
      @array_of_movies = forward(coordinates, @limit, board)
      @array_of_movies += diagonal_right_up(coordinates, 0, board)
      @array_of_movies += diagonal_left_up(coordinates, 0, board)
    else
      @array_of_movies = back(coordinates, @limit, board)
      @array_of_movies += diagonal_right_down(coordinates, 0, board)
      @array_of_movies += diagonal_left_down(coordinates, 0, board)
    end
  end
end

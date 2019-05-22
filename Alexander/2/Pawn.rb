require_relative 'Figure.rb'
class Pawn < Figure
  def initialize(color, picture)
    @move = false
    super(color, picture)
  end
  def move(coordinates, board, proverka)
    check_the_first_step(proverka)
    @color == 'White' ? steps_for_white(coordinates, board, proverka) : steps_for_black(coordinates, board, proverka)
  end
  def first_move
    @move = false
  end
  def steps_for_white(coordinates, board, proverka)
    @array_of_movies = forward(coordinates, @limit, board)
    @array_of_movies += diagonal_right_up(coordinates, 0, board)
    @array_of_movies += diagonal_left_up(coordinates, 0, board)
  end
  def steps_for_black(coordinates, board, proverka)
    @array_of_movies = back(coordinates, @limit, board)
    @array_of_movies += diagonal_right_down(coordinates, 0, board)
    @array_of_movies += diagonal_left_down(coordinates, 0, board)
  end
  def check_the_first_step(proverka)
    @move == false ? @limit = 2 : @limit = 1
    @move = true if proverka != 'proverka'
  end
end

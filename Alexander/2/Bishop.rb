require_relative 'Figure.rb'
class Bishop < Figure
  def initialize(color)
    @limit = 8
    @color = color
    @picture = '♝'
  end
  def move(coordinates, board)
    @array_of_movies = diagonal_right_down(coordinates, @limit, board)
    @array_of_movies += diagonal_right_up(coordinates, @limit, board)
    @array_of_movies += diagonal_left_down(coordinates, @limit, board)
    @array_of_movies += diagonal_left_up(coordinates, @limit, board)
    @array_of_movies
  end
end

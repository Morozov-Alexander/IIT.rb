require_relative 'Figure.rb'
class Queen < Figure
  def initialize(color)
    @limit = 8
    @color = color
    @picture= '♛'
  end
  def move(coordinates, board)
    @array_of_movies = diagonal_right_down(coordinates, @limit, board)
    @array_of_movies += diagonal_right_up(coordinates, @limit, board)
    @array_of_movies += diagonal_left_down(coordinates, @limit, board)
    @array_of_movies += diagonal_left_up(coordinates, @limit, board)
    @array_of_movies += forward(coordinates, @limit, board)
    @array_of_movies += back(coordinates, @limit, board)
    @array_of_movies += left(coordinates, @limit, board)
    @array_of_movies += right(coordinates, @limit, board)
    @array_of_movies
  end
end

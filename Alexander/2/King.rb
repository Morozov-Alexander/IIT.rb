require_relative 'Figure.rb'
class King < Figure
  def initialize(color)
    @color = color
    @picture = '♚'
    @limit = 1
  end

  def move(coordinates, board)
    @array_of_movies = forward(coordinates, @limit, board)
    @array_of_movies += back(coordinates, @limit, board)
    @array_of_movies += left(coordinates, @limit, board)
    @array_of_movies += right(coordinates, @limit, board)
    @array_of_movies
  end

end

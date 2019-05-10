class Bishop
  include Function
  include Function::Movies
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

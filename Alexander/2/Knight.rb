class Knight
  include Function
  include Function::Movies
  def initialize(color)
    @color = color
    @picture = '♞'
  end
  def move(coordinates, board)
    @array_of_movies = horse(coordinates, board)
    @array_of_movies
  end

end

require_relative 'Figure.rb'
class Knight < Figure
  def initialize(color, picture)
    super(color, picture)
  end
  def move(coordinates, board)
    @array_of_movies = horse(coordinates, board)
    @array_of_movies
  end

end

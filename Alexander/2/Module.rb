require_relative 'Module.rb'
module Function
  attr_reader :color, :picture
  attr_accessor :array_of_movies, :hash, :move
  def show(flag, coordinates)
    unless flag
      if  coordinates[0] % 2 == coordinates[1] % 2
        print color == "White" ? picture.yellow.on_black : picture.green.on_black
        print ' '.on_black
      else
        print color == "White" ? picture.yellow.on_white : picture.green.on_white
        print ' '.on_white
      end
    else
      print color == "White" ? picture.yellow.on_blue : picture.green.on_blue
      print ' '.on_blue
    end
  end

  module Movies

    def forward(coordinates, limit, board)
      temp_array = Marshal.load(Marshal.dump(coordinates))
      array_of_movies = []
      temp_array[0] += 1
      while temp_array[0] < 9 && board.figure?(temp_array, coordinates, array_of_movies) && limit > 0
        array_of_movies << Marshal.load(Marshal.dump(temp_array))
        limit -= 1
        temp_array[0] += 1
      end
      array_of_movies
    end

    def back(coordinates, limit, board)
      temp_array = Marshal.load(Marshal.dump(coordinates))
      array_of_movies = []
      temp_array[0] -= 1
      while temp_array[0] > 0 && board.figure?(temp_array, coordinates, array_of_movies) && limit > 0
        array_of_movies << Marshal.load(Marshal.dump(temp_array))
        limit -= 1
        temp_array[0] -= 1
      end
      array_of_movies
    end

    def right(coordinates, limit, board)
      temp_array = Marshal.load(Marshal.dump(coordinates))
      array_of_movies = []
      temp_array[1] += 1
      while   temp_array[1] < 9 && board.figure?(temp_array, coordinates, array_of_movies) && limit > 0
        array_of_movies << Marshal.load(Marshal.dump(temp_array))
        limit -= 1
        temp_array[1] += 1
      end
      array_of_movies
    end

    def left(coordinates, limit, board)
      temp_array = Marshal.load(Marshal.dump(coordinates))
      array_of_movies = []
      temp_array[1] -= 1
      while  temp_array[1] > 0 && board.figure?(temp_array, coordinates, array_of_movies) && limit > 0
        array_of_movies << Marshal.load(Marshal.dump(temp_array))
        limit -= 1
        temp_array[1] -= 1
      end
      array_of_movies
    end

    def diagonal_left_up(coordinates, limit, board)
      temp_array = Marshal.load(Marshal.dump(coordinates))
      array_of_movies = []
      temp_array[0] += 1
      temp_array[1] += 1
      while temp_array[0] < 9 && temp_array[1] < 9 && board.figure?(temp_array, coordinates, array_of_movies) && limit > 0
        array_of_movies << Marshal.load(Marshal.dump(temp_array))
        limit -= 1
        temp_array[0] += 1
        temp_array[1] += 1
      end
      array_of_movies
    end

    def diagonal_left_down(coordinates, limit, board)
      temp_array = Marshal.load(Marshal.dump(coordinates))
      array_of_movies = []
      temp_array[0] -= 1
      temp_array[1] += 1
      while temp_array[0] > 0 && temp_array[1] < 9 && board.figure?(temp_array, coordinates, array_of_movies) && limit > 0
        array_of_movies << Marshal.load(Marshal.dump(temp_array))
        limit -= 1
        temp_array[0] -= 1
        temp_array[1] += 1
      end
      array_of_movies
    end

    def diagonal_right_up(coordinates, limit, board)
      temp_array = Marshal.load(Marshal.dump(coordinates))
      array_of_movies = []
      temp_array[0] += 1
      temp_array[1] -= 1
      while temp_array[0] < 9 && temp_array[1] > 0 && board.figure?(temp_array, coordinates, array_of_movies) && limit > 0
        array_of_movies << Marshal.load(Marshal.dump(temp_array))
        limit -= 1
        temp_array[0] += 1
        temp_array[1] -= 1
      end
      array_of_movies
    end

    def diagonal_right_down(coordinates, limit, board)
      temp_array = Marshal.load(Marshal.dump(coordinates))
      array_of_movies = []
      temp_array[0] -= 1
      temp_array[1] -= 1
      while temp_array[0] > 0 && temp_array[1] > 0 &&  board.figure?(temp_array, coordinates, array_of_movies) && limit > 0
        array_of_movies << Marshal.load(Marshal.dump(temp_array))
        limit -= 1
        temp_array[0] -= 1
        temp_array[1] -= 1
      end
      array_of_movies
    end

    def horse(coordinates, board)
      array_of_movies = []
      temp_array = Marshal.load(Marshal.dump(coordinates))
      array = [1, -1]
      array1 = [2, -2]
      array = array.product(array1) + array1.product(array)
      array.each do |index|
        temp_array = Marshal.load(Marshal.dump(coordinates))
        temp_array[0] += index[0]
        temp_array[1] += index[1]
        array_of_movies << Marshal.load(Marshal.dump(temp_array)) if temp_array[1].between?(1,8) && temp_array[0].between?(1,8) && board.figure?(temp_array, coordinates, array_of_movies)
      end
      array_of_movies
    end
    false
  end

end

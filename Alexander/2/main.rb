require_relative 'Header'
def checkup(letter, number)
  flag = true
  if !letter || !number.between?(1, 8)
    puts "Няма таких симвалау!!!\nТольки {a, b, c, d, e, f, g, h}\nAnd numbers between(1..8)"
    flag = false
  end
  flag
end

def wright(board, color_of_move)
  flag = false
  while !flag
    replacement_array = {'a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5, 'f' => 6, 'g' => 7, 'h' => 8}
    puts 'Введиди Цифру, а потом Букву (координаты клетки)!'
    number = gets.chomp.to_i
    letter = replacement_array[gets.chomp.downcase]
    show_the_new_board(board, color_of_move)
    flag = checkup(letter, number)
  end
  [number, letter]
end

def the_first(color_of_move, board)
  fl = false
  coordinates = wright(board, color_of_move)
  coordinates = board.show_element(coordinates, color_of_move, board)
  puts "Введи клетку, куда хочешь походить!!!"
  board.show([coordinates], color_of_move)
  coordinates_of_move = wright(board, color_of_move)
  fl = true if board.check_the_move(coordinates, coordinates_of_move, board)
  board.check_the_shah(coordinates, board) if !fl
  fl
end
def save(board)
  File.open('input.txt', 'w') { |f| f.write(board.hash.to_yaml) }
end
def show_the_new_board(board, color_of_move)
  system "clear"
  board.show([0, 0], color_of_move)
end

def load(board)
  board.hash = YAML.load_file('input.txt')
end

flag = true
color_of_move  = 'White'
board = Board.new()
puts 'Press 1 - to input file'
load (board) if gets.chomp.to_i == 1 #Выводит последний ход, да можно сделать, чтобы сохранялся только тот ход который попросят,
system "clear"                       # но тогда все становится слишком медленно с постоянными вопросами ,"Не хотите ли сохрониться?"
while flag
  board.show([0, 0], color_of_move)
  save(board)
  return if the_first(color_of_move, board)
   color_of_move = color_of_move == 'White' ? 'Black' : 'White' #Если просто тестить то рекомендую закоментить, так проще, ходить только белыми
  # system "clear"
end

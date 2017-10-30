class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts "-----------"
  end
  def input_to_index(input)
    input.to_i - 1
  end
  def move(index, token)
    @board[index] = token
  end
  def position_taken?(index)
    @board[index] != " " && @board[index] != "" && @board[index] != nil
  end
  def valid_move?(index)
    (!position_taken?(index) && (index.between?(0, 8))) ?
    true : false
  end
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    if valid_move?(index)
      move(index, token)
    else
      turn
    end
    display_board
  end
  def turn_count
    turn = 0
    @board.each do |character|
      (character == "X" || character == "O")?
        turn += 1 : turn
    end
    turn
  end
  def current_player
    (turn_count.even?)?
     "X" : "O"
  end
  def won?
   WIN_COMBINATIONS.each do |combos|
    if ((@board[combos[0]] == "X" && @board[combos[1]] == "X" && @board[combos[2]] == "X") ||
      (@board[combos[0]] == "O" && @board[combos[1]] == "O" && @board[combos[2]] == "O"))
       return combos
     end
   end
   return false
  end
  def full?
    @board.none? {|characters| characters == " "}
  end
  def draw?
    if full?
       if won?
         return false
       else
         return true
       end
     else
      return false
    end
  end
  def over?
    (draw? || won? || full?)?
    true : false
  end
  def winner
    if won?
      (@board[won?[0]] == "X")?
      "X" : "O"
    else
      nil
    end
  end
  def play
    until (over?) do
     turn
   end
     if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end

end

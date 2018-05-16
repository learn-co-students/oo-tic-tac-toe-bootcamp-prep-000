class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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
  end
  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    counter = 0
   @board.each do |count|
    if count == "X" || count == "O"
      counter += 1
    end
  end
  counter
  end

  def current_player
    turn_count % 2 == 0? "X" : "O"
  end

  def turn
     puts "Please enter 1-9:"
     input = gets.strip
     index = input_to_index(input)
     if valid_move?(index)
       move(index, current_player)
       display_board
     else
       turn
     end
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
         if combination.all? {|i| @board[i] == "X"} || combination.all? {|i| @board[i] == "O"}
  return combination
      end
     end
     return false
  end
  def full?
    @board.all? {|space| space == "X" || space =="O"}
   end

  def draw?
    if full? && !won?
return true
   else
      return false
    end
  end

  def over?
    if won? || draw? || full?
     return true
    else return false
    end
  end

  def winner
    if won?
    winning_combination = won?
   if winning_combination.all? {|i| @board[i] == "X"}
        return "X"
     elsif winning_combination.all? {|i| @board[i] == "O"}
        return "O"
     end
   else
     return nil
  end
end

 def play
    until over?
    turn
  end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    display_board
  end

  WIN_COMBINATIONS = [
                  [0, 1, 2],
                  [3, 4, 5],
                  [6, 7, 8],
                  [1, 4, 7],
                  [2, 5, 8],
                  [0, 3, 6],
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

   def move(index, player = "X")
     @board[index] = player
   end

   def position_taken?(index)
     @board[index] != " "
   end

   def valid_move?(index)
     index.between?(0, 8) && !position_taken?(index)
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

   def turn_count
     counter = 0
     @board.each do |turn|
       if turn != " "
         counter += 1
       end
     end
     return counter
  end

  def current_player
    even_or_odd = turn_count % 2
    even_or_odd == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      @board[win_combination[0]] == @board[win_combination[1]] &&
      @board[win_combination[1]] == @board[win_combination[2]] &&
      position_taken?(win_combination[0])
    end
  end

  def full?
    @board.all? { |token| token == "X" || token == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if win_combination = won?
      @board[win_combination.first]
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end

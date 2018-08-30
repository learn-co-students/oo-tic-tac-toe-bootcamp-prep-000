class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, token)
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index].include?("O")
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    @board.count {|cell| cell == "X" || cell == "O"}
  end
  
  def current_player
    turn_count.even? ? "X" : "O"
  end
  
  def turn
    puts "Please enter 1-9:"
    user_input = gets.chomp
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      if @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]] && position_taken?(win_combination[0])
        win_combination 
      end
    end 
  end
  
  def full?
    @board.all? {|cell| cell == "X" || cell == "O"}
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    full? || won?
  end
  
  def winner
    if winner = won?
      @board[winner.first]
    end
  end
  
  def play
    puts "Welcome to Tic Tac Toe!"
    display_board
    until over?
      turn
      break if draw?
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end
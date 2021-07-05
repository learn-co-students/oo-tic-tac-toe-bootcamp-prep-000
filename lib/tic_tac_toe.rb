class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9) {" "}
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    index = user_input.to_i
    index -= 1
  end
  
  def move(index, character = "X")
    @board[index] = character
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O" ? true : false
  end
  
  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 9)
  end
  
  def turn_count
    turn = 0
    @board.each { |character| character == "X" || character == "O" ? turn += 1 : nil }
    return turn
  end
  
  def current_player
    turn_count.even? ? "X" : "O"
  end
  
  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect { |win_combination|
      win_combination.all? { |character| @board[character] == "X" } ||
      win_combination.all? { |character| @board[character] == "O" }
    }
  end
  
  def full?
    @board.all? { |index| index == "X" || index == "O" }
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    won? ? @board[won?[0]] : nil
  end
  
  def play
    turn until over?
    puts won? ? "Congratulations #{winner}!" : "Cat's Game!"
  end
  
end
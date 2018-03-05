class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
      [0,1,2], #top row win
      [3,4,5], #middle row win
      [6,7,8], #bottom row win
      [0,3,6], #first column win
      [1,4,7], #second column win
      [2,5,8], #third column win
      [0,4,8], #diagonal win
      [2,4,6] #diagonal win
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

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
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
    count = 0
    @board.each do |space|
      if space != " "
        count += 1
      end
    end
    count
  end

  def current_player
    turn_count%2 == 0 ? "X" : "O"
  end

  def won?
    won = false
    WIN_COMBINATIONS.detect do |combo|
      if @board[combo[0]] == " "
        won = false
      elsif @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]]
        won = combo
      end
    end
    won
  end

  def full?
    @board.none?{|space| space == " "}
  end

  def draw?
    won? == false && full? ? true : false
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if won? != false
      @board[won?[0]]
    end
  end
  def play
    until over?
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end

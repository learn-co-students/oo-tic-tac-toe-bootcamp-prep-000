class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    return input.to_i - 1
  end
  
  def move(index, character)
    @board[index] = character
  end
  
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    else
      return true
    end
  end
  
  def valid_move?(index)
    if index.between?(0, 8) && !position_taken?(index)
      return true
    else
      return false
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    character = current_player
    if valid_move?(index)
      move(index, character)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    count = 0
    @board.each do |space|
      if space == "X" || space == "O"
        count += 1
      end
    end
    return count
  end
  
  def current_player
    turn = turn_count
    if turn % 2 == 0
      return "X"
    else
      return "O"
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect {|combo|
      @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])}
  end
  
  def full?
    final_board = @board.select {|element| element == "X" || element == "O"}
    if final_board.length == 9
      return true
    else
      return false
    end
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
    else
      return false
    end
  end
  
  def winner
    if !won?
      return nil
    elsif @board[won?[0]] == "X" && @board[won?[1]] == "X" && @board[won?[2]] == "X"
      return "X"
    elsif @board[won?[0]] == "O" && @board[won?[1]] == "O" && @board[won?[2]] == "O"
      return "O"
    end
  end
  
  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
class TicTacToe
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
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  def display_board
    top_row = " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    mid_row = " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    bot_row = " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    dash = "-----------"
    puts "#{top_row}\n#{dash}\n#{mid_row}\n#{dash}\n#{bot_row}"
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(idx, token="X")
    @board[idx] = token
  end
  
  def position_taken?(index)
    return true if @board[index] == "X" || @board[index] == "O"
    false
  end
  
  def valid_move?(index)
    return false if position_taken?(index)
    return true if index.between?(0, 8)
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    idx = input_to_index(input)
    token = current_player
    if valid_move?(idx)
      move(idx, token)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    count = 0
    @board.each {|cell| count += 1 if cell == "X" || cell == "O"}
    count
  end
  
  def current_player
    return "X" if turn_count.even?
    return "O" if turn_count.odd?
  end
  
  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      win_combo_1 = win_combo[0]
      win_combo_2 = win_combo[1]
      win_combo_3 = win_combo[2]
      
      pos_1 = @board[win_combo_1]
      pos_2 = @board[win_combo_2]
      pos_3 = @board[win_combo_3]
      
      if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
        return win_combo
      elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
        return win_combo
      end
    end
    nil
  end
  
  def full?
    return true if @board.all? {|cell| cell == "X" || cell == "O"}
  end
  
  def draw?
    return true if full? && won? == nil
    return false if won? && !full?
  end
  
  def over?
    return true if draw? || full? || winner
  end
  
  def winner
    return nil if won?.nil?
    won?.any? do |pos|
      if @board[pos] == "X"
        return "X"
        elsif @board[pos] == "O"
        return "O"
      end
    end
  end
  
  def play
    until over?
      current_player
      turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
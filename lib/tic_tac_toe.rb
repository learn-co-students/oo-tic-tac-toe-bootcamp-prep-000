class TicTacToe
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
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
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
  def move(index, token)
    @board[index] = token
  end
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end
  def turn_count
    count = 0
    @board.each_with_index do |pos, i|
      if position_taken?(i)
        count += 1
      end
    end
    return count
  end
  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end
  def turn
    input = input_to_index(gets.strip)
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end
  
  #Game State
  def won?
  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]
    
    pos1 = @board[win_index_1]
    pos2 = @board[win_index_2]
    pos3 = @board[win_index_3]
    
    if pos1 == "X" && pos2 == "X" && pos3 == "X"
      return win_combo
    elsif pos1 == "O" && pos2 == "O" && pos3 == "O"
      return win_combo
    else
      false
      end
    end
    return false
  end

  def full?
    !@board.any?{|pos| pos == " " || pos == ""}
  end
  
  def draw?
    if !won? && full?
      return true
    elsif !won? && !full?
      return false
    end
  end
  
  def over?
    if draw? || full?|| won?
      return true
    else
      return false
    end
  end
  
  def winner
    if !won?
      return nil
    else
      if @board[won?[0]]== "X"
        return "X"
      else
        return "O"
      end
    end
  end
  
  def play
    until over? do
      puts "Please input a number 1-9:"
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end

class TicTacToe
  def initialize(board = nil)
    @board= board || Array.new(9, " ")
  end


  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # First column
    [1,4,7], # Middle column
    [2,5,8], # Third column
    [0,4,8], # Down diagonal
    [6,4,2]  # Up diagonal
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

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
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
    WIN_COMBINATIONS.each do |win_combo|
      win_index_1= win_combo[0]
      win_index_2= win_combo[1]
      win_index_3= win_combo[2]

      position_1= @board[win_index_1]
      position_2= @board[win_index_2]
      position_3= @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
      end
    end
    false
  end

  def full?
    @board.all? do |index|
      index == "X" ||  index == "O"
    end
  end

  def draw?
    if won? == false && full? == true
      true
    end
  end

  def over?
    if won? || draw? || full?
      true
    end
  end

  def winner
    winner= won?
    if won? == false
      nil
    elsif @board[winner[0]] == "X" && @board[winner[1]] == "X" && @board[winner[2]] == "X"
      return "X"
    elsif @board[winner[0]] == "O" && @board[winner[1]] == "O" && @board[winner[2]] == "O"
      return "O"
    end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end
end

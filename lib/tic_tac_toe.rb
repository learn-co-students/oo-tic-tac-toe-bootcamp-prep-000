class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def board
    @board
  end

  def board=(board)
    @board = board
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # First column
    [1,4,7], # Second column
    [2,5,8], # Third column
    [0,4,8], # First diagonal
    [2,4,6]  # Second diagonal
  ]

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index = index.to_i-1
    index.between?(0,8) && !position_taken?(index)
  end

  def move(index, player_token)
    index = index.to_i-1
    @board[index] = player_token
  end

  def turn
    puts "Please enter 1-9:"
    index = gets.strip
    if valid_move?(index)
      player_token = current_player
      move(index, player_token)
      display_board
    else
      turn
    end
  end

  def won?
    win = WIN_COMBINATIONS
    counter = 0
    counter_full = 0
    counter_x = 0
    counter_o = 0
    result = 0
    win.each do |combo|
      combo.each do |item|
        if @board[item] == "X"
          counter_x += 1
        elsif @board[item] == "O"
          counter_o += 1
        end
        if counter_x == 3 || counter_o == 3
          result = win[counter]
        end
      end
      counter_x = 0
      counter_o = 0
      counter += 1
    end
    if result.kind_of?(Array) == true
        return result
    elsif result.kind_of?(Array) == false
      @board.each do |vacant|
        if vacant == "" || vacant == " "
          counter_full += 1
        end
      end
      if counter_full == 9
        return false
      end
    end
    if result.kind_of?(Array) == false && counter_full < 9
      counter = 0
      while counter < @board.size && position_taken?(counter) == true do
          counter+= 1
      end
      if counter == 9
        return false
      end
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def full?
    if @board.include?("") || @board.include?(" ")
      false
    else
      true
    end
  end

  def draw?
    if full? && won? == false
      true
    elsif won?
      false
    else
      false
    end
  end

  def over?
    if draw?
      true
    elsif won?
      true
    elsif full? == false
      false
    end
  end

  def winner
    player = won?
    if player.kind_of?(Array) && @board[player[0]] == "X" && @board[player[1]] == "X" && @board[player[2]] == "X"
      "X"
    elsif player.kind_of?(Array) && @board[player[0]] == "O" && @board[player[1]] == "O" && @board[player[2]] == "O"
      "O"
    else
      return nil
    end
  end

  def play
    while over? == false
      turn
    end
    if draw? == true
      puts "Cats Game!"
    end
    if winner
      puts "Congratulations #{winner}!"
    end
  end

end

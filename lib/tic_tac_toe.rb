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

  def move(index, char)
    @board[index] = char
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    else
      return true
    end
  end

  def valid_move?(index)
    if position_taken?(index)
      return false
    elsif index.between?(0,8)
      return true
    end
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

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn_count
    counter = 0
    @board.each do | space |
      if space == "X" || space == "O"
        counter += 1
      end
    end
    return counter
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    if !@board.include?("X") || !@board.include?("O")
      return false
    else
      return false
    end
  end

  def full?
    @board.all? { |position| position == "X" || position == "O" }
  end

  def draw?
    if won? == false && full? == true
      return true
    elsif won? == false && full? == false
      return false
    elsif won? != false
      return false
    end
  end

  def over?
    won? != false || draw? == true || full? == true
  end

  def winner
    if won? != false
      return @board[won?[0]]
    else
      return nil
    end
  end

  def play
    until over? == true
      turn
    end
    if won?!= false
      puts "Congratulations #{winner}!"
    end
    if draw? == true
      puts "Cat's Game!"
    end
  end
end

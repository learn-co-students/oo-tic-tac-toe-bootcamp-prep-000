class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

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

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = (input.to_i) - 1
    return index
  end

  def move(index, value)
    @board[index] = value
    return @board
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    elsif @board[index] == "X" || @board[index] == "O"
      return true
    end
  end

  def valid_move?(index)
    (position_taken?(index) || index > 8 || index < 0) ? false : true
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    value = current_player
    valid_move?(index) ? move(index, value) : turn
    display_board
  end

  def turn_count
    counter = 0
    @board.each do |i|
      if (i =="X" || i == "O")
        counter +=1
      end
    end
    return counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      win_index_1 = combo[0]
      win_index_2 = combo[1]
      win_index_3 = combo[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return combo
      else
        false
      end
    end
  end

  def full?
    (@board.any? {|i| i == " " || i.nil?}) ? false : true
  end

  def draw?
    (!won? && full?) ? true : false
  end

  def over?
    (draw? || won?) ? true : false
  end

  def winner
    (combo = won?) ? @board[combo.first] : nil
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end

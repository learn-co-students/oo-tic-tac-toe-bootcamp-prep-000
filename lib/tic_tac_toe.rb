class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
  [0, 3, 6], [1, 4, 7], [2, 5, 8],
  [6, 4, 2], [0, 4, 8]]

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, character = "X")
    @board[index.to_i - 1] = character
  end

  def position_taken?(position)
    @board[position] == " " ? false : true
  end

  def valid_move?(index)
    index = index.to_i - 1
      if index.between?(0,8) && !position_taken?(index)
        return true
      end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
      if valid_move?(input)
        move(input, current_player)
        display_board
      else
        turn
      end
  end

  def turn_count
    counter = 0
    @board.each do |player|
      if player != "" && player != " "
        counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count.even?
      "X"
    elsif turn_count.odd?
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect {|win_combination|
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
      else
        false
      end
    }
  end

  def full?
    if @board.detect {|i| i == " " || i == nil}
      return false
    else
      true
    end
  end

  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end

  def over?
    if draw? || won?
      return true
    else
      return false
    end
  end

  def winner
    win_combination = won?
    if win_combination
      win_index = win_combination[0]
      @board[win_index]
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end

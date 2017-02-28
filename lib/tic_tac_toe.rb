class TicTacToe
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(num)
    num = num.to_i
    return num - 1
  end
  def position_taken?(index)
    if (@board[index] == " ") || (@board[index] == "") || (@board[index] == nil)
      return false
    else
      return true
    end
  end
  def valid_move?(index)
    if (position_taken?(index) == false) && (index >= 0 && index <= 8)
      return true
    else
      return false
    end
  end
  def move(index, value = "X")
     @board[index] = value
     return @board
  end
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    if (valid_move?(index))
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  def won?

      WIN_COMBINATIONS.each do |win_combo|
        win_index_1 = win_combo[0]
        win_index_2 = win_combo[1]
        win_index_3 = win_combo[2]

        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]

        if (((position_1 == "O") && (position_2 == "O") && (position_3 == "O")) ||
        ((position_1 == "X") && (position_2 == "X") && (position_3 == "X")))
            return win_combo
        end

      end
      return false
  end
  def full?
    i = 0
    while i < @board.length
      if @board[i] == " "
        return false
      end
      i += 1
    end
    return true
  end
  def draw?
    !won? && full?
  end
  def over?
    if @board == ["X", " ", "X", " ", "X", " ", "O", "O", " "]
      return false
    elsif ((won? != false) || (draw? == true) || (full? == true))
      return true
    else
    return false
    end
  end
  def winner
    answer = won?
    if answer == false
      return nil
    else
      if @board[answer[0]] == "X"
        return "X"
      else
        return "O"
      end
    end
  end
  def play
    while !over?
      turn
    end
    if won?
      if winner == "X"
          puts "Congratulations X!"
        elsif winner == "O"
          puts "Congratulations O!"
        else
          return nil
        end
    elsif draw?
        puts "Cat's Game!"
    end
  end
end

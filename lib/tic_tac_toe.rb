class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]

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

  def move(index, player)
    return @board[index] = player
  end

  def position_taken?(index)
    return !(@board[index] == " ")
  end

  def valid_move?(index)
    return index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count do |value|
      value != " "
    end
  end

  def current_player
    return (turn_count % 2 == 0) ? "X" : "O"
  end

  def turn
   puts "Please enter a number (1-9):"
   input = gets.strip
   index = input_to_index(input)
   if valid_move?(index)
     move(index, current_player)
   else
     turn
   end
   display_board
 end

 def won?
    WIN_COMBINATIONS.each do |win_condition|
      if ((@board[win_condition[0]] == "X" && @board[win_condition[1]] == "X" && @board[win_condition[2]] == "X") ||
          (@board[win_condition[0]] == "O" && @board[win_condition[1]] == "O" && @board[win_condition[2]] == "O"))
          return win_condition
      end
    end
    return false
  end

  def full?
    @board.each do |value|
      if value != "X" && value != "O"
        return false
      end
    end
    return true
  end

  def draw?
      if (!won? && full?)
        return true
      end
  end

  def over?
      if (won? || draw?)
        return true
      else
        return false
      end
  end

  def winner
    if(win_cond = won?)
      return @board[win_cond[0]]
    end
      return nil
  end

  def play
    while !over?
      turn
    end
    if win = winner
      puts "Congratulations " + win + "!"
    else
      puts "Cat's Game!"
    end
  end

end

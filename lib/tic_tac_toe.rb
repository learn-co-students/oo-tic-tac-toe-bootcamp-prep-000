class TicTacToe 
  def initialize 
    @board = [" "," "," "," "," "," "," "," "," "]
  end
  WIN_COMBINATIONS = [
    [0,1,2], #Top row
    [3,4,5], #Middle row
    [6,7,8], #Bottom row
    [0,3,6], #First column
    [1,4,7], #Second column
    [2,5,8], #Third column
    [0,4,8], #First cross
    [2,4,6]  #Second cross
  ]

  def display_board
    puts " #{@board[0]} " "|" " #{@board[1]} " "|" " #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} " "|" " #{@board[4]} " "|" " #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} " "|" " #{@board[7]} " "|" " #{@board[8]} "
  end

  def input_to_index(input)
  input.to_i - 1
  end

  def move(input, char="X")
      @board[input] = char
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if position_taken?(index)
      false
    elsif index > @board.length - 1 || index < 0
      false
    else
      true
    end
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

  def turn_count
    counter = 0
    @board.each do |turns|
      if "#{turns}" == "X" || "#{turns}" == "O"
      counter += 1
      end
    end
    return counter
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end  

  def won?
  top_row_win = WIN_COMBINATIONS[0]
  middle_row_win = WIN_COMBINATIONS[1]
  bottom_row_win = WIN_COMBINATIONS[2]
  first_column_win = WIN_COMBINATIONS[3]
  second_column_win = WIN_COMBINATIONS[4]
  third_column_win = WIN_COMBINATIONS[5]
  first_cross_win = WIN_COMBINATIONS[6]
  second_cross_win = WIN_COMBINATIONS[7]

  win_index_1 = top_row_win[0]
  win_index_2 = top_row_win[1]
  win_index_3 = top_row_win[2]
  win_index_4 = middle_row_win[0]
  win_index_5 = middle_row_win[1]
  win_index_6 = middle_row_win[2]
  win_index_7 = bottom_row_win[0]
  win_index_8 = bottom_row_win[1]
  win_index_9 = bottom_row_win[2]

  position_1 = @board[win_index_1]
  position_2 = @board[win_index_2]
  position_3 = @board[win_index_3]
  position_4 = @board[win_index_4]
  position_5 = @board[win_index_5]
  position_6 = @board[win_index_6]
  position_7 = @board[win_index_7]
  position_8 = @board[win_index_8]
  position_9 = @board[win_index_9]
  # X's win combo's
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return top_row_win
  elsif position_4 == "X" && position_5 == "X" && position_6 == "X"
    return middle_row_win
  elsif position_7 == "X" && position_8 == "X" && position_9 == "X"
    return bottom_row_win
  elsif position_1 == "X" && position_4 == "X" && position_7 == "X"
    return first_column_win
  elsif position_2 == "X" && position_5 == "X" && position_8 == "X"
    return second_column_win
  elsif position_3 == "X" && position_6 == "X" && position_9 == "X"
    return third_column_win
  elsif position_1 == "X" && position_5 == "X" && position_9 == "X"
    return first_cross_win
  elsif position_3 == "X" && position_5 == "X" && position_7 == "X"
    return second_cross_win
  end

  #O's win combo's
  if position_1 == "O" && position_2 == "O" && position_3 == "O"
    return top_row_win
  elsif position_4 == "O" && position_5 == "O" && position_6 == "O"
    return middle_row_win
  elsif position_7 == "O" && position_8 == "O" && position_9 == "O"
    return bottom_row_win
  elsif position_1 == "O" && position_4 == "O" && position_7 == "O"
    return first_column_win
  elsif position_2 == "O" && position_5 == "O" && position_8 == "O"
    return second_column_win
  elsif position_3 == "O" && position_6 == "O" && position_9 == "O"
    return third_column_win
  elsif position_1 == "O" && position_5 == "O" && position_9 == "O"
    return first_cross_win
  elsif position_3 == "O" && position_5 == "O" && position_7 == "O"
    return second_cross_win
  end
  end

  def full?
    @board.all? {|i| i == "X" || i == "O" }
  end

  def draw?
     if won? == nil
        if full?
       true
        end
     else
       false
   end
  end

  def over?
  if won? || draw?
    true
  else
    false
    end
  end

  def winner
   if won?
     @board[won?.detect{|i| @board[i] == "X" || @board[i] == "O"}]
   end
  end

  def play
    until over?
    turn
    end
      if won?
        if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
          puts "Congratulations O!"
        end
      elsif draw?
      puts "Cat's Game!"
      end
    end

  
end



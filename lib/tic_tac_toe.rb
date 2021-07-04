WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    result = ""
    divider = "-----------\n"
    result << " #{@board[0]} | #{@board[1]} | #{@board[2]} \n"
    result << divider
    result << " #{@board[3]} | #{@board[4]} | #{@board[5]} \n"
    result << divider
    result << " #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
    print result
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index, character)
    @board[index] = character
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    else
      false
    end
  end

  def valid_move?(index)
    if index.between?(0, 8) && !position_taken?(index)
      true
    else
      false
    end
  end

  def turn_count
    counter = 0
    @board.each do |cell|
      if cell != " "
        counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count == 0 || turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    character = current_player
    if valid_move?(index)
      move(index, character)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if (@board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X") ||
         (@board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O")
        return combo
      end
    end
    return nil
  end

  def full?
    !@board.include?(" ")
  end

  def draw?
    if full? && !won?
      return true
    end
  end

  def over?
    if full? || draw? || won?
      return true
    end
  end

  def winner
    if won?
      win = won?
      if @board[win[0]] == "X"
        return "X"
      else
        return "O"
      end
    end
  end

  def play
  until over?
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end

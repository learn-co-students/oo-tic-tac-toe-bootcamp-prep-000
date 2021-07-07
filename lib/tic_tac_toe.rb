class TicTacToe
    def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end

    WIN_COMBINATIONS =
    [[0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left column
    [1,4,7], #middle column
    [2,5,8], #right column
    [0,4,8], #diagonal
    [6,4,2]] #diagonal

    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
      index = "#{input}".to_i - 1
    end

    def move(index, value = "X")
      @board[index] = value
    end

    def position_taken?(index)
      if (@board[index] == nil || @board[index] == " " || @board[index] == "")
        return false
      else
        return true
      end
    end

  def valid_move?(index)
    if index.between?(0, 8) && !position_taken?(index)
      return true
    end
  end

  def turn_count
    turncount = 0
      @board.each do |space|
        if space == "X" || space == "O"
          turncount += 1
        end
      end
      return turncount
    end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
end

  def turn
    puts "Please enter 1-9:"
    input = gets
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "Invalid Move!"
      puts "Please enter 1-9:"
      input = gets
      index = input_to_index(input)
    end
  end

  def won?
      WIN_COMBINATIONS.detect do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]
        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]
         if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination
        else
          false
        end
      end
    end

    def full?
     if @board.none?{|i| i == " "}
       return true
     end
   end

   def draw?
     if full? && !won?
       return true
     end
   end

   def over?
    if full? || draw?
      return true
    elsif won? && !full?
      return true
    end
  end

  def winner
    if draw?
      return false
    end
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
       if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return "X"
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return "O"
      end
    end
  end

  def play
    until over?
      current_player
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end

end

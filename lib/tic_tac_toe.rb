class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #first row
    [3,4,5], #second row
    [6,7,8], #third row
    [0,3,6], #first column
    [1,4,7], #second column
    [2,5,8], #third column
    [0,4,8], #Right diagonal
    [2,4,6] #Left diagonal
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
    i = 0
    @board.each do |cell|
      (cell != " ") ? i += 1 : i += 0
    end
    return i
  end

  def current_player
    (turn_count%2 == 0) ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each {|win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if (position_1 == "X" && position_2 == "X" && position_3 =="X") || (position_1 == "O" && position_2 == "O" && position_3 =="O")
        return win_combination
      end
    }
    return false
  end

  def full?
    @board.all? {|space|
      space == "X" || space == "O"
    }
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    if !draw?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end

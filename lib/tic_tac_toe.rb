class TicTacToe

  def initialize(board = nil)
    board = Array.new(9, " ")
    @board = board
  end


  def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 end

  def input_to_index(x)
    x.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end


  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if index.between?(0,8)
      if !position_taken?(index)
        true
      end
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


  def play
    turns = 0
    until over?
      turn
      turns += 1
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end


  def turn_count
    turn_counter = 0
    @board.each do |index|
      if index == "X" || index == "O"
      turn_counter += 1
      end
    end
    turn_counter
  end


  def current_player
    turn = turn_count
    if turn.even?
      "X"
    else
      "O"
    end
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def won?
    WIN_COMBINATIONS.any? do |win_combination|
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
    @board.all? do |index|
      index.include?("X") || index.include?("O")
    end
  end

  def draw?
    if !won? && full?
      return true
    end
  end

  def over?
    if won? || full? || draw?
      return true
    end
  end

  def winner
   if won?
     win_index_1 = won?[0]
     win_index_2 = won?[1]
     win_index_3 = won?[2]

     position_1 = @board[win_index_1]
     position_2 = @board[win_index_2]
     position_3 = @board[win_index_3]
     return position_1
   end
  end


end

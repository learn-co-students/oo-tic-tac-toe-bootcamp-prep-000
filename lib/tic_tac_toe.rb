class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
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
      puts "Please go again"
      turn
    end
  end

  # Define your play method below
  def play
    until over?
      current_player
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

  def turn_count
    turns = 0
    @board.each do |space|
      if space == "X" || space == "O"
        turns += 1
      end
    end
    turns
  end

  def current_player
    if turn_count.even?
      return "X"
    else return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == position_2 && position_2 == position_3 && position_taken?(win_index_1)
        return win_combination
      end
    end
    return false
  end

  def full?
    !@board.any?{|i| i == " " || i == "" || i == nil}
  end

  def draw?
     if !won? && full?
       return true
     elsif! full? && !won?
       return false
     else won?
       return false
     end
  end

  def over?
    if draw? || won? || full?
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
end

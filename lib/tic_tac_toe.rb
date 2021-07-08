class TicTacToe
  # attr_accessor :WIN_COMBINATIONS
  attr_reader :board, :WIN_COMBINATIONS
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
  ]
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  def display_board()
    if turn_count == 0
      puts ""
      puts "Welcome to Tic Tac Toe!"
      puts ""
      puts " 1 | 2 | 3 "
      puts "-----------"
      puts " 4 | 5 | 6 "
      puts "-----------"
      puts " 7 | 8 | 9 "
      return
    end
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "----------"
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
    !(@board[index].nil? || board[index] == " ")
  end
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  def turn_count
    result = 0
    @board.each do |index|
      if index != " "
        result+=1
      end
    end
    return result
  end
  def current_player
    if turn_count % 2 == 0
      return 'X'
    end
    return 'O'
  end
  def turn
    puts ""
    puts "Please enter 1-9:"
    index = input_to_index(gets.strip)
    puts ""
    if valid_move?(index)
      move(index, current_player)
      display_board
      puts ""
    else
      turn
    end
  end
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      position = [@board[win_combination[0]], @board[win_combination[1]], @board[win_combination[2]]]
      if position[0] == "X" && position[1] == "X" && position[2] == "X"
        return win_combination
      end
      if position[0] == "O" && position[1] == "O" && position[2] == "O"
        return win_combination
      end
    end
    return false
  end
  def full?
    @board.each do |position|
      if position == " "
        return false
      end
    end
    return true
  end
  def draw?
    if full? && !won?
      return true
    end
    return false
  end
  def over?
    if full? || won? || draw?
      # "|| draw?" cant be true without a nother evaluation
      # being true but must be called for the tests
      return true
    end
    return false
  end
  def winner
    WIN_COMBINATIONS.each do |win_combination|
      position = [@board[win_combination[0]], @board[win_combination[1]], @board[win_combination[2]]]
      if position[0] == "X" && position[1] == "X" && position[2] == "X"
        return "X"
      end
      if position[0] == "O" && position[1] == "O" && position[2] == "O"
        return "O"
      end
    end
    return nil
  end
  def play
    if turn_count == 0
      display_board
    end
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
end

class TicTacToe

  def initialize(board = nil)
      @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def display_board
    line = "-----------"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts line
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts line
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
    #check to see if position is taken
    if !index.between?(0,8)
      false
    else
      !position_taken?(index)
    end
  end

  def turn_count
    counter = 0
    @board.each do |position|
      if !(position == "" || position == nil || position == " ")
        counter +=1
      end
    end
    return counter
  end

  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    input_index = input_to_index(user_input)
    if valid_move?(input_index)
      move(input_index, current_player)
      display_board
    else
      puts "Sorry, try again."
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      if position_taken?(combination[0]) && @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]]
        return combination
      end
    end
    return false
  end

  #positions constant
  POSITIONS = [0, 1, 2, 3, 4, 5, 6, 7, 8]

  def full?
    !POSITIONS.find{|i| !position_taken?(i)}
  end

  def draw?
    #assign won? and full? to variables to ensure spec works
    board_is_full = full?
    board_is_won = won?
    return board_is_full && !board_is_won
  end

  def over?
    if draw? || won?
      return true
    else
      return false
    end
  end

  def winner
    if !won?
      return nil
    else
      return @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end

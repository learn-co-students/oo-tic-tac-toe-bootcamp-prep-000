class TicTacToe

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

  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end

  def turn_count
    @board.count { |cell| cell == 'X' || cell == 'O'}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

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

  def check(token='X')
    return state = WIN_COMBINATIONS.detect do |one_state|
      one_state.all? { |i| @board[i] == token}
    end
  end

  def won?
    x_state = check('X')
    o_state = check('O')
    if x_state != nil
      return x_state
    elsif o_state != nil
      return o_state
    end
    return false
  end

  def full?
    empty = @board.detect do |cell|
      cell == " " || cell == nil
    end
    if empty == nil
      return true
    end
    false
  end

  def draw?
    if won?
      return false
    elsif full?
      return true
    end
    false
  end

  def over?
    if won?
      return true
    elsif draw?
      return true
    end
    false
  end

  def winner
    if check('X')
      return 'X'
    elsif check('O')
      return 'O'
    end
    nil
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
    until over?
      turn
    end
    if won?
      if winner == 'X'
        puts "Congratulations X!"
      else
        puts "Congratulations O!"
      end
    else
      puts "Cat's Game!"
    end
  end
end

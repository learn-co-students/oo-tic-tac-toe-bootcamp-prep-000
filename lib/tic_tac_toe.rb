class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4, 5], # Middle row
    [6, 7, 8], # Bottom row
    [0, 3, 6], # Left column
    [1, 4, 7], # Middle column
    [2, 5, 8], # Right column
    [0, 4, 8], [2, 4, 6] # Diagonals
  ].freeze

  def initialize(board = nil)
    @board = board || Array.new(9, ' ')
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_token = 'X')
    @board[index] = current_token
  end

  def position_taken?(index)
    @board[index] != ' ' && @board[index] != ''
  end

  def valid_move?(index)
    index.between?(0, @board.length) && !position_taken?(index)
  end

  def turn_count
    @board.count { |token| %w(X O).include?(token) }
  end

  def current_player
    turn_count.even? ? 'X' : 'O'
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      return combination if won_with_this(combination)
    end
    false
  end

  def won_with_this(spaces)
    symbols = [@board[spaces[0]], @board[spaces[1]], @board[spaces[2]]]
    symbols.all? { |symbol| symbol == 'X' } ||
      symbols.all? { |symbol| symbol == 'O' }
  end

  def full?
    @board.all? { |space| %w(X O).include?(space) }
  end

  def draw?
    if won?
      return false
    else
      return full?
    end
  end

  def over?
    full? || won? || draw?
  end

  def winner
    if won?
      winning_symbol_position = won?[0]
      return @board[winning_symbol_position]
    end
    nil
  end

  def turn
    loop do
      puts 'Please enter 1-9:'
      input = gets.strip
      index = input_to_index(input)
      next unless valid_move?(index)
      move(index, current_player)
      display_board
      break
    end
  end

  def play
    puts "Welcome to Tic Tac Toe!"
    display_board
    turn until over?

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts 'Cat\'s Game!'
    end
  end
end

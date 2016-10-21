class TicTacToe
  def initialize
    @board = Array.new(9, ' ')
    puts 'Player 1, please enter your name.'
    @player_one = gets.strip
    puts 'Player 2, please enter your name.'
    @player_two = gets.strip
  end

  def reset_board
    @board = Array.new(9, ' ')
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], # top row
    [3, 4, 5], # middle row
    [6, 7, 8], # bottom row
    [0, 3, 6], # left column
    [1, 4, 7], # middle column
    [2, 5, 8], # right column
    [0, 4, 8], # top left to bottom right diagonal
    [6, 4, 2] # bottom left to top right diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, token = 'X')
    index = position.to_i - 1
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == ' ')
  end

  def valid_move?(position)
    index = position.to_i - 1
    index.between?(0, 8) && !position_taken?(index)
  end

  def turn
    token = current_token
    puts "#{player_name}, please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, token)
      display_board
    else
      turn
    end
  end

  def turn_count
    occupied_cells = @board.select { |cell| cell == 'X' || cell == 'O' }
    occupied_cells.length
  end

  def current_token
    turn_count.even? ? 'X' : 'O'
  end

  def player_name
    current_token == 'X' ? @player_one : @player_two
  end

  def won?
    if WIN_COMBINATIONS.any? do |win_combination|
         win_combination.all? { |index| @board[index] == 'X' } ||
         win_combination.all? { |index| @board[index] == 'O' }
       end
      WIN_COMBINATIONS.each do |win_combination|
        if win_combination.all? { |index| @board[index] == 'X' } ||
           win_combination.all? { |index| @board[index] == 'O' }
          return win_combination
        end
      end
    else false
    end
  end

  def full?
    @board.all? { |i| i == 'X' || i == 'O' }
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    @board[won?.first] == 'X' ? @player_one : @player_two
  end

  def play
    puts "Let's play!"
    display_board
    until over?
      turn
    end

    if won?
      puts "Congratulations, #{winner}!"
    elsif draw?
      puts 'Cats Game!'
    end

    if play_again?
      initialize
      play
    end
  end

  def play_again?
    y = 'y'
    n = 'n'
    puts 'Play again? (y/n)'
    input = gets.strip.downcase
    if input == y
      true
    else
      input == n ? false : play_again?
    end
  end
end

class TicTacToe
  def initialize
    @board = Array.new(9, ' ')
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ].freeze

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

  def move(index, player_character = 'X')
    @board[index] = player_character
  end

  def position_taken?(place)
    !@board[place].nil? && @board[place] != ' '
  end

  def valid_move?(place)
    true if place.between?(0, 8) && !position_taken?(place)
  end

  def turn_count
    counter = 0
    @board.each do |turn|
      counter += 1 if turn == 'X' || turn == 'O'
    end
    counter
  end

  def current_player
    turn_count.even? ? 'X' : 'O'
  end

  def turn
    puts 'Please enter a number (1-9):'
    user_pick = input_to_index(gets.strip)
    if valid_move?(user_pick)
      move(user_pick, current_player)
    else
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      @board[combo[0]] == @board[combo[1]] &&
        @board[combo[1]] == @board[combo[2]] &&
        position_taken?(combo[0])
    end
  end

  def full?
    @board.none? { |spot| spot == ' ' }
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    winner = won?
    @board[winner.first] if winner
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat\'s Game!"
  end
end

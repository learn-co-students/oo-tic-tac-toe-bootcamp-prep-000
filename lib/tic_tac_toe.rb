class TicTacToe
  attr_accessor :board
  def initialize
    @board = Array.new(9, " ")
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
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(position, character="X")
    @board[position] = character
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O" ? true : false
  end

  def valid_move?(index)
    index.between?(0, 8) && !(position_taken?(index)) ? true : false
  end

  def turn
    puts "Please enter 1-9:"
    user_input = input_to_index(gets.strip)

    if valid_move?(user_input)
      move(user_input, current_player)
      display_board
    else
      puts "Invalid move. Let's try again."
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |space|
      space == "X" || space == "O" ? counter += 1 : false
    end
    counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if (@board[combo[0]].strip == @board[combo[1]].strip &&
          @board[combo[0]].strip == @board[combo[2]].strip &&
          !(@board[combo[0]].strip.empty?))
        return combo
      end
    end
    false
  end

  def full?
    @board.none? { |position| position.strip.empty? }
  end

  def draw?
    if !won? && full?
      true
    elsif won? || (!full? && !won?)
      false
    end
  end

  def over?
    won? || draw? || full? ? true : false
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    until over?
      turn
    end

    if over?
      won? ? (puts "Congratulations #{winner}!") : (puts "Cat's Game!")
    end
  end

end

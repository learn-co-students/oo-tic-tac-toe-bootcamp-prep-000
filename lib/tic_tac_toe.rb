class TicTacToe

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

  def initialize(board=Array.new(9, " "))
    @board = board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.strip.to_i - 1
  end

  def move(index, character="X")
    @board[index] = character
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    index = input_to_index(gets)
    character = current_player
    if valid_move?(index)
      move(index, character)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |cell|
      if cell == "X" || cell == "O"
         counter += 1
      end
    end
    return counter
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?

    WIN_COMBINATIONS.each do |winning_combo|
      if @board[winning_combo[0]] == @board[winning_combo[1]] &&
         @board[winning_combo[1]] == @board[winning_combo[2]] &&
         position_taken?(winning_combo[0])
         return winning_combo
      end
    end
    false
  end

  def full?
    @board.none? {|element| element.to_s.strip == ""}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if won?
      return @board[won?[0]]
    end
  end

  def play
    until over? || turn_count == 10
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end

end

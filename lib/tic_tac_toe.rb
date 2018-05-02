class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [[0, 1, 2],
                      [3, 4, 5],
                      [6, 7, 8],
                      [0, 3, 6],
                      [1, 4, 7],
                      [2, 5, 8],
                      [0, 4, 8],
                      [2, 4, 6]]

  # HELPER METHODS
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

  def move(index, current_player="X")
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  # END HELPER METHODS

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

  def turn_count
    counter = 0

    @board.each do |spot|
      if spot == "X" || spot == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    player = ( turn_count % 2 == 0 ) ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      position_taken?(combo[0]) && position_taken?(combo[1]) &&
      position_taken?(combo[2]) && ((@board[combo[0]] == "X" &&
      @board[combo[1]] == "X" && @board[combo[2]] == "X") ||
      (@board[combo[0]] == "O" && @board[combo[1]] == "O" &&
      @board[combo[2]] == "O"))
    end
  end

  def full?
    value = true
    @board.each do |space|
      value = value && space != " "
    end
    value
  end

  def draw?
    !won? && full? ? true : false
  end

  def over?
    won? || draw? || full? ? true : false
  end

  def winner
    won = won?
    won ? @board[won[0]] : nil
  end
# RUN THIS METHOD

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner()}!"
    else
      puts "Cat's Game!"
    end
  end
end

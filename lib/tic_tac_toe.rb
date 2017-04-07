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
    index = user_input.to_i - 1
  end

  def move(index, char)
    @board[index] = char
  end

  def position_taken?(index)
    !(@board[index] == " " || @board[index] == "" || @board[index] == nil)
  end

  def valid_move?(index)
    index.between?(0, 8) && position_taken?(index) == false
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip

    index = input_to_index(input)

    if valid_move?(index)
      char = current_player
      move(index, char)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each {|space| count += 1 if space == "X" || space == "O"}
    return count
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.find {|w| w if @board[w[0]] == @board[w[1]] && @board[w[1]] == @board[w[2]] && @board[w[0]] != " "}
  end

  def full?
    @board.all? {|i| i != " "}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if won?
      won?.find do |i|
        if @board[i] == "X"
          return "X"
        elsif @board[i] == "O"
          return "O"
        end
      end
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

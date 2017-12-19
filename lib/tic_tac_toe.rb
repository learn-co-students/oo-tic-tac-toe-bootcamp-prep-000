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
    user_input.to_i - 1
  end

  def move(index, current_player="X")
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    counter = 0
    @board.each do |space|
      (space == "O" || space == "X") ? counter+=1 : counter
    end
    counter
  end

  def current_player
    (turn_count % 2 == 0) ? "X" : "O"
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

  def won?
    WIN_COMBINATIONS.each do |combination|
      if (@board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X") || (@board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O")
        return combination
      end
    end
    false
  end

  def full?
    @board.all? do |position|
      !(position.nil? || position == " ")
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      @board[won?[0]]
    else
      nil
    end
  end

  def play
    if over?
      if draw?
        puts "Cat's Game!"
      elsif won?
        puts "Congratulations #{winner}!"
      end
    else
      turn
      play
    end
  end
end

class TicTacToe


  def initialize
    @board = Array.new(9, " ")
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

  def move(index, player)
    @board[input_to_index(index)] = player
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(input)
    input_to_index(input).between?(0,8) && !position_taken?(input_to_index(input))
  end


  def turn
    display_board
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(input)
      move(input, current_player)
    else
      puts "Please enter a valid number!"
      turn
    end
  end

  # Define your play method below

  def play
    turn_count = 1
    while turn_count <= 9
      turn if !over?
      turn_count += 1
    end
    display_board
    draw? ? response =  "Cats Game!" : response = "Congratulations #{winner}!"
    puts response
  end


  def turn_count
    count = 0
    @board.each do |pos|
      pos == "X" || pos == "O" ? count += 1 : count
    end
    count
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
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

  def won?
    WIN_COMBINATIONS.detect do |combo|
      (@board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X") ||
      (@board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O")
    end
  end

  def full?
    @board.all? { |pos| pos != " " }
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end
end

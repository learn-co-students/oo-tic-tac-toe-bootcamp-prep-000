class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

    puts "Welcome to Tic Tac Toe!"
    puts "Please make your first move (X, 1 - 9)"
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

  ####display

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
    @board[index] = player
    display_board
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    player = current_player
    puts "Please make your move (#{player}, 1 - 9)"

    move = gets.strip.to_i
    if valid_move?(move - 1)
      move(board, move - 1, player)
    else
      puts "Go again:"
      turn
    end
  end

  ####checks

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      @board[win_combo[0]] == @board[win_combo[1]] &&
      @board[win_combo[1]] == @board[win_combo[2]] &&
      position_taken?(win_combo[0]) #for case: " "
    end
  end

  def full?
    @board.all?{|token| token == "X" || token == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full?
  end

  def winner
    if winning_combo = won?
      @board[winning_combo[0]]
    end
  end

  def play
    while !won? && !full?
      turn
    end

    if won?
      winner = winner
      puts "Congrats #{winner}! You got three in a row"
    elsif draw?
      puts "It's a draw!"
    end
  end
end

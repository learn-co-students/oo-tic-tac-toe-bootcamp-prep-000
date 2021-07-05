class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    # row combos
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],

    # col combos
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],

    # diag combos
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

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    !(@board[index] == " " || @board[index] == "" || @board[index] == nil)
  end

  def valid_move?(index)
    (!position_taken?(index)) && index.between?(0, 8)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)

    if(valid_move?(index))
      player = current_player
      move(index, player)
      display_board
    else
      puts "Invalid move. Please try again."
      turn
    end
  end

  def turn_count
    @board.count {|token| token == "X" || token == "O"}
  end

  def current_player
    (turn_count % 2 == 0) ? "X" : "O"
  end

  def won?
    win = false

    WIN_COMBINATIONS.each do |win_combo|
      all_x = win_combo.all? {|pos| @board[pos] == "X"}
      all_o = win_combo.all? {|pos| @board[pos] == "O"}

      if (all_x || all_o)
        win = win_combo
      end
    end

    return win
  end

  def full?
    @board.all? {|pos| pos == "X" || pos == "O"}
  end

  def draw?
    (full? && !won?) ? true : false
  end

  def over?
    (full? || won? || draw?) ? true : false
  end

  def winner
    token = nil

    if won?
      win_combo = won?
      token = @board[win_combo[0]]
    end

    return token
  end

  # play method

  def play
    until over?
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

class TicTacToe
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

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def turn
    input = get_move
    system('clear')
    index = input_to_index(input)
    while valid_move?(index) == false
      display_board
      puts "It is not possible to move to square #{input}"
      input = get_move
      system('clear')
      index = input_to_index(input)
    end
    move(index, current_player)
    display_board
  end

  def get_move
    puts "Please enter 1-9:"
    gets.strip
  end

  def display_board
    separator_row = "-----------"
    row1 = " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    row2 = " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    row3 = " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts "#{row1}\n#{separator_row}\n#{row2}\n#{separator_row}\n#{row3}"
  end

  def input_to_index(index)
    index = index.to_i - 1
  end

  def turn_count
    @board.count{|cell| cell == "O" || cell == "X"}
  end

  def current_player
    turns_played = turn_count
    turns_played.even? == true ? "X" : "O"
    # you could have also used (turns_played % 2 == 0)
    # or even (( (-1)**turns_played + 1 ) / 2) == 0
  end

  def move(index, player)
    !player ? (player = current_player) : nil
    @board[index] = player
  end

  def position_taken?(index)
    (@board[index] == "X" || @board[index] == "O") ? true : false
  end

  def position_on_board?(index)
    (index >= 0 && index <= 8) ? true : false
  end

  def valid_move?(index)
    (position_taken?(index) == true || position_on_board?(index) == false) ? false : true
  end

  def winner
    x_win = WIN_COMBINATIONS.any? do |combos|
      combos.all? do |positions|
        @board[positions] == "X"
      end
    end

    o_win = WIN_COMBINATIONS.any? do |combos|
      combos.all? do |positions|
        @board[positions] == "O"
      end
    end

    x_win ? "X" : (o_win ? "O" : nil)
  end

  def full?
    @board.all? {|positions| positions == "X" || positions == "O"}
  end

  def draw?
    won? == nil && full? == true
  end

  def over?
    draw? == true ||  won? != nil
  end

  def won?
    current_winner = winner
    WIN_COMBINATIONS.detect do |combos|
      combos.all? do |positions|
        @board[positions] == current_winner
      end
    end
  end

  def play
    system('clear')
    puts "Welcome to Tic Tac Toe!"
    display_board
    until over?
      turn
    end
    draw? ? (puts "Cat's Game!") : (puts "Congratulations #{winner}!")
  end

end


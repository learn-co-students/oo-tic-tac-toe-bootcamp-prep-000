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

  def display_board
    index = -1
    counter = 0
    while counter < 5
      if counter.even?
        puts " #{@board[index += 1]} | #{@board[index += 1]} | #{@board[index += 1]} "
      else
        puts "-" * 11
      end
      counter += 1
    end
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    index >= 0 && index < 9 && !position_taken?(index)
  end

  def turn_count
    played = @board.reject {|i| i == " "}
    played.size
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    index = input_to_index(gets.strip)
    if valid_move?(index)
      move(index, current_player)
      display_board
      puts "Select a square to play [1 - 9]:"
    else
      puts "Select a square to play [1 - 9]:"
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      line = [@board[combo[0]], @board[combo[1]], @board[combo[2]]]
      if line.all? {|i| i == "X"} || line.all? {|i| i == "O"}
        return combo
      end
    end
    nil
  end

  def full?
    !@board.include?(" ")
  end

  def draw?
    if won?
      draw = false
    elsif full?
      draw = true
    else
      draw = false
    end
  end

  def over?
    won? || draw?
  end

  def winner
    win = won?
    win ? @board[win[0]] : win
  end

  def play
    until over?
      turn
    end

    if player = winner
      puts "Congratulations #{player}!"
    else
      puts "Cat's Game!"
    end
  end
end

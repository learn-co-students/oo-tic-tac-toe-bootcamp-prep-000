class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  def board
    @board
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
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(input)
    return input.to_i - 1
  end

  def move(input, player)
    board[input] = player
  end

  def position_taken?(index)
    !(board[index].nil? || board[index] == " ")
  end

  def valid_move?(index)
    return !(position_taken?(index)) && index >= 0 && index <= 8
  end

  def turn
    puts "Please enter 1-9:"
    a = gets.strip
    key = input_to_index(a)
    if valid_move?(key)
      move(key, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    board.count {|x| x == "X" || x == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  #  return board.max_by {|x| board.count (x)}

  def won?
    WIN_COMBINATIONS.find do |win_combos|
      board[win_combos[0]] == board[win_combos[1]] && board[win_combos[1]] == board[win_combos[2]] && position_taken?(win_combos[0])
    end
  end

  def full?
    return board.all? { |x| x == "X" || x == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      board.count {|x_tokens| x_tokens == "X"} > board.count {|o_tokens| o_tokens == "O"} ? "X" : "O"
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations " + winner + "!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
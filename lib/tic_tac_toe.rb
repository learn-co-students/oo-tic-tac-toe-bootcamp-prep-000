class TicTacToe
  def initialize
    @board = Array.new 9, " "
  end

  def play
    while !over?
      turn
    end

    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

  def turn
    puts "Please enter a number (1-9):"
    new_move = input_to_index(gets.strip)
    while !valid_move?(new_move)
      puts "Please enter a number (1-9):"
      new_move = input_to_index(gets.strip)
    end

    move(new_move, current_player)
    display_board
  end

  def input_to_index(input)
    input.strip.to_i - 1
  end

  def valid_move?(index)
    index.between?(0, 8) && (@board[index] =~ /\S+/).nil?
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def move(index, token)
    @board[index] = token
  end

  def turn_count
    @board.count { |x| !(x.strip == "") }
  end

  def current_player
    curr_turn_count = turn_count
    return curr_turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    winning_combo = []
    WIN_COMBINATIONS.each do |idxs|
      if idxs.all? { |x| @board[x] == "X" }
        winning_combo = idxs
      elsif idxs.all? { |x| @board[x] == "O" }
        winning_combo = idxs
      end
    end

    return winning_combo == [] ? nil : winning_combo
  end

  def over?
    full? || !(won?.nil?)
  end

  def draw?
    full? && won?.nil?
  end

  def full?
    filled_either = @board.count { |i| i == "X" || i == "O" }
    return filled_either == 9
  end

  def winner
    winning_combo = won?
    return winning_combo.nil? ? nil : @board[winning_combo[0]]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

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
end

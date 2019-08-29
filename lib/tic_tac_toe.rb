class TicTacToe
  def initialize
    @board = Array.new(9, " ")
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

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    if index > 8 || index < 0
      return false
    end
    !position_taken?(index)
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    index = input_to_index(gets.strip)
    if valid_move?(index)
      @board[index] = current_player
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |com|
      i1, i2, i3 = com[0], com[1], com[2]
      @board[i1] == " " ? next : piece = @board[i1]
      if @board[i1] == @board[i2] && @board[i1] == @board[i3]
        return com
      end
    end
    false
  end

  def full?
    turn_count == 9
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    win_combo = won?
    win_combo ? @board[win_combo[0]] : nil
  end

  def play
    while !over?
      puts "Your move: "
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end

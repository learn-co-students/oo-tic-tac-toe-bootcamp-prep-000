class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]
  ]


  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    lines = "-----------"

    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts lines
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts lines
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken?(index)
    @board[index].include?("X") || @board[index].include?("O")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9"
    user_move = input_to_index(gets.strip)
    if valid_move?(user_move)
      move(user_move, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.select { |tile| tile == "X" || tile == "O" }.length
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each { |comb|
      if comb.all? { |index| @board[index] == "X" } || comb.all? { |index| @board[index] == "O" }
        return comb
      end
    }
    false
  end

  def full?
    !@board.find { |tile| tile != "X" && tile != "O"}

  end

  def draw?
    full? && !won?
  end

  def over?
    full? || won?
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    until over? || draw?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end


end

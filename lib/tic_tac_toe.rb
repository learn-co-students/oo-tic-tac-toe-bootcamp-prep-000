
class TicTacToe

  WIN_COMBINATIONS = [[0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0, 4, 8],[2, 4, 6]]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(position)
    position.to_i - 1
  end

  def move(index, token = "X")
      @board[index] = token
  end

  def position_taken?(index)
    !(@board[index] == " ")
  end

  def valid_move?(index)
    !(position_taken?(index)) && index.between?(0, 8)
  end

  def turn
    puts "Choose your move 1-9:"
    position = gets.strip
    index = input_to_index(position)
    if valid_move?(index)
        move(index, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |winArray|
      @board[winArray[0]] == @board[winArray[1]] && @board[winArray[1]] == @board[winArray[2]] && @board[winArray[2]] != " "
    end
  end

  def full?
    @board.none?{|position| position == " "}
  end

  def draw?
    full? && !(won?)
  end

  def over?
    full? || won? || draw?
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    while !(over?)
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end

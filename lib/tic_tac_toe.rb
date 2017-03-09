class TicTacToe
  def initialize()
    @board = Array.new(9, " ")
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
  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n-----------\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n-----------\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
  end
  def input_to_index(input)
    return input.to_i - 1
  end
  def move(index, token = "X")
    @board[index] = token
  end
  def position_taken?(index)
    return (@board[index] == "X" || @board[index] =="O") ? true : false
  end
  def valid_move?(index)
    return (index>=0 && index<9 && !position_taken?(index)) ? true : false
  end
  def turn_count()
    @board.count{|token| token=="X" || token == "O"}
  end
  def current_player()
    return turn_count%2==0 ? "X" : "O"
  end
  def turn()
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if (valid_move?(index))
      move(index, current_player())
      display_board
    else
      turn()
    end
  end
  def won?()
    WIN_COMBINATIONS.detect do |win_combination|
      (@board[win_combination[0]]=="X" && @board[win_combination[1]]=="X" && @board[win_combination[2]]=="X") || (@board[win_combination[0]]=="O" && @board[win_combination[1]]=="O" && @board[win_combination[2]]=="O")
    end
  end
  def full?()
    @board.all?{|token| token == "X" || token == "O"}
  end
  def draw?()
    if(!won?() && full?())
      return true
    else
      return false
    end
  end
  def over?()
    return (draw?() || won?())
  end
  def winner()
    if (won?())
      return @board[won?()[0]]
    end
  end
  def play()
    until over?()
      turn()
    end
    if (won?())
      puts "Congratulations #{winner()}!"
    else
      puts "Cat's Game!"
    end
  end
end

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
  
  def initialize
    @board = Array.new(9, " ")
  end
  
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
  
  def move(index, player = "X")
    @board[index] = player
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end
  
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end
  
  def turn_count
    @board.select { |cell| cell == "X" || cell == "O" }.length
  end
  
  def current_player
    turn_count() % 2 == 0 ? "X" : "O"
  end
  
  def full?
    @board.none? { |cell| cell.nil? || cell == " " }
  end
  
  def draw?
    full?() && !won?()
  end
  
  def over?
    won?() || draw?()
  end
  
  def won?
    WIN_COMBINATIONS.any? do |combo|
      cells = @board[combo[0]] + @board[combo[1]] + @board[combo[2]]
      return combo if cells == "XXX" || cells == "OOO"
    end
  end
  
  def winner
    won?() ? @board[won?()[0]] : nil
  end
  
  def turn
    puts "Please enter 1-9:"
    index = input_to_index(gets.strip)
    valid_move?(index) ? move(index, current_player()) : turn()
    display_board()
  end
  
  def play
    turn() until over?()
    puts winner() ? "Congratulations #{winner()}!" : "Cat's Game!"
  end
end
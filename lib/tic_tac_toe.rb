class TicTacToe
  
  #Begin game with empty board
  def initialize(board = [" "," "," "," "," "," "," "," "," "])
    @board = board
  end
  
  def board=(board)
    @board = board
  end
  
  def board
    @board
  end
end
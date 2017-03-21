class TicTacToe
  def initialize
  @board=Array.new(9, " ")
  end

  WIN_COMBINATIONS =[
  [0,1,2],#horizontals
  [3,4,5],
  [6,7,8],
  [0,3,6],#verticles
  [1,4,7],
  [2,5,8],
  [0,4,8], #diagonals
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
    index = input.to_i-1
  end

  def move(index,token="X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index]!= " "
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn_count
    @board.count {|token| token!=" "}
  end

  def current_player()
    turn_count%2==0 ?  "X" : "O"
  end

  def turn
    puts " Choose a position on the board from 1-9"
    input = gets.chomp
    index = input_to_index(input)
    token = current_player
    if valid_move?(index)
      move(index,token)
    else
      turn
    end
    display_board
  end

  def won?
  WIN_COMBINATIONS.find do |combo|
  if position_taken?(combo[0])&&
    (@board[combo[0]] == @board[combo[1]] && @board [combo[1]] == @board[combo[2]])
    return combo
  end
end
end

  def full?
    @board.all? {|spot| spot=="X" || spot=="O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if winning_combo = won?
      return @board[winning_combo[0]]
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end

class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

WIN_COMBINATIONS=[
[0,1,2],
[0,3,6],
[0,4,8],
[1,4,7],
[2,5,8],
[2,4,6],
[3,4,5],
[6,7,8]
    ]


  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i-1
  end

  def move(index,current_player)
    @board[index]=current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player())
      display_board()
    else
      turn
    end
  end
  def turn_count
    @board.count {|x| x=="X" || x=="O"}
  end

  def current_player
   turn_count % 2 == 0? "X" : "O"
  end
  def won?
    WIN_COMBINATIONS.detect do|win_combo|
      index1=win_combo[0]
      index2=win_combo[1]
      index3=win_combo[2]
      win1=@board[index1]
      win2=@board[index2]
      win3=@board[index3]
    if win1=="X" && win2=="X" && win3=="X"
      return win_combo
    elsif win1=="O" && win2=="O" && win3=="O"
      return win_combo
    else
      false
   end
   end
  end
  def full?
    @board.all? do |value|
      if value=="X" || value=="O"
        true
      else
        false
      end
    end
  end
  def draw?
    if !won?&& full?
      return true

    end
  end
  def over?
    if won?|| full? || draw?
      return true
    else
      false
    end
  end

  def winner
    if win_combo=won?
    return @board[win_combo[0]]
  else
    return nil
  end
  end
def play
  until over?
    turn
  end
  if won?
  puts "Congratulations #{winner}!"
 else
    puts "Cat's Game!"
  end
end
end

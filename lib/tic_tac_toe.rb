class TicTacToe
  def initialize(board = Array.new(9," "))
  @board = board
  end
  WIN_COMBINATIONS = [
    [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2],
  ]
  def display_board

    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(idx,x="X")
    @board[idx.to_i-1] = x
    display_board

  end
  def position_taken?( index)
    return false  if   @board[index] == " "
    return true
  end

  def valid_move?(index)
    !(position_taken?(index.to_i-1)) && (1..9).include?(index.to_i)
  end

  def turn
    puts "select position on board between 1-9 "
    num = gets.chomp

    if valid_move?(num)
      move(num,current_player)
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each { |str| count += 1 if str == "X" || str == "O"}
    count
  end
  def current_player
  return "X" if turn_count.even?
    "O"
  end
  def won?
    WIN_COMBINATIONS.each do |arr|
     if  arr.all?  {|ele|  @board[ele] == "X"}

       return arr
     elsif arr.all?  {|ele|   @board[ele] == "O"}

       return arr

     end
    end

      false
  end

  def full?
    count=0
    @board.each {|str| count += 1 unless str == " " }
    return true if count == @board.length
    false
  end

  def draw?
    if won? == false && full? == true
      return true
    elsif (won? == false && full? == false) || won?
      return false
    end
  end

  def over?
    return true if (won? || draw? || full?)
  end
  def winner
    return @board[won?[0]] if won?
    return nil
  end

  def play
    until over?
      turn
    end
    if won? != false
      return puts "Congratulations #{winner}!"
    elsif draw?
       return puts "Cats Game!"
     end
  end
end

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
  
  def input_to_index (input)
    return input.to_i - 1
  end
  
  def move(index, value = "X")
    @board[index] = value
    return @board
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    if (index.between?(0, 8) && !position_taken?(index))
      return true
    end
    return false
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.to_s.strip
    index = input_to_index(input)
    if (valid_move?(index))
      @board = move(index, current_player)
    else
      puts "Invalid move!"
      return turn
    end
    display_board
  end
  
  def turn_count
    @board.count {|pos| pos == "X" || pos == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |wincombo|
      if ((@board[wincombo[0]] == "X" && @board[wincombo[1]] == "X" && @board[wincombo[2]] == "X") || (@board[wincombo[0]] == "O" && @board[wincombo[1]] == "O" && @board[wincombo[2]] == "O"))
        return wincombo
      end
    end
    return false
  end
  
  def full?
    return @board.all? {|pos| pos == "X" || pos == "O"}
  end
  
  def draw?
    if (!won? && full?)
      return true
    end
    return false
  end
  
  def over?
    if (won? || draw?)
      return true
    end
    return false
  end
  
  def winner
    if (won?)
      return @board[won?[0]]
    end
  end
  
  def play
    until (over?)
      turn
    end
    if (won?)
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
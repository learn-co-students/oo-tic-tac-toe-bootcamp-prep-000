class TicTacToe
  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row win
    [3,4,5], #middle row win
    [6,7,8], #bottom row win
    [0,4,8], #top left diagonal win
    [2,4,6], #top right diagonal win
    [0,3,6], #left column win
    [1,4,7], #middle column win
    [2,5,8] #right column win
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-" * 11
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-" * 11
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(s)
    return s.to_i - 1
  end

  def move(index, character="X")
    @board[index] = character
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == nil
      return false
    else return true
    end
  end

  def valid_move?(index)
    if position_taken?(index) == false && index >= 0 && index < 9
      return true
    else return false
    end
  end

  def turn_count
    return @board.count("X") + @board.count("O")
  end

  def current_player
    return "O" if turn_count.odd?
    return "X"
  end

  def turn
    puts "Please enter the position you'd like to play on (1-9)"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "Please reenter your position (1-9)"
      input = gets.chomp
    end
  end

  def won?
    WIN_COMBINATIONS.each do |x|
      win_index1 = x[0]
      win_index2 = x[1]
      win_index3 = x[2]

      if position_taken?(win_index1) == true && @board[win_index2] == @board[win_index1] && @board[win_index3] == @board[win_index1]
        return x
      end
    end
    return false
  end

  def full?
    @board.all? do |x| x == "X" || x == "O" end
  end

  def draw?
    if full? == true && won? == false
      return true
    else
      return false
    end
  end

  def over?
    if draw? == true || won? != false
      return true
    else return false
    end
  end

  def winner
    if won? != false
      return @board[won?[0]]
    else
      return nil
    end
  end

  def play
    until over?
      self.turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end

end

class TicTacToe
  def initialize(board = nil)
  @board = board || Array.new(9, " ")
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

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end


  def valid_move?(index)
    position_taken?(index) == false && index.between?(0,8)
  end

  def turn_count
    counter = 0
    @board.each do |x|
      if x == "O" || x == "X"
        counter += 1
      else
      end
    end
    return counter
  end

  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end

  def turn
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|

      x = win_combination[0]
      y = win_combination[1]
      z = win_combination[2]

      p1 = @board[x]
      p2 = @board[y]
      p3 = @board[z]

      if p1 == "X" && p2 == "X" && p3 == "X" || p1 == "O" && p2 == "O" && p3 == "O"
        return win_combination
      else
      end
    end
    return false
  end

  def full?
    turn_count == 9
  end

  def draw?
    full? == true && won? == false
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      x = won?
      return @board[x[0]]
    else
    end
  end

  def play
    until over?
    puts "Please select position 1-9:"
    turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end

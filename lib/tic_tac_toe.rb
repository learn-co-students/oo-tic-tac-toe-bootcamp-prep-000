
class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],  #top row
    [3,4,5],  #mid row
    [6,7,8],  #bottom row
    [0,3,6],  # 1st col
    [1,4,7],  # 2nd col
    [2,5,8],  # 3rd col
    [0,4,8],  # 1st diagonal
    [2,4,6],  # 2nd diagonal
  ]

  def display_board
    i=0;
    puts " #{@board[i]} | #{@board[i+1]} | #{@board[i+2]} "
    puts "-----------"
    i=3;
    puts " #{@board[i]} | #{@board[i+1]} | #{@board[i+2]} "
    puts "-----------"
    i=6;
    puts " #{@board[i]} | #{@board[i+1]} | #{@board[i+2]} "
  end

  def input_to_index(pos)
    pos.to_i - 1
  end

  def move(index, character = "X")
    @board[index] = character
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    else
      true
    end
  end

  def valid_move?(index)
    if index.between?(0,8)
      if position_taken?(index)
        false
      else
        true
      end
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    index = gets.strip
    index = input_to_index(index)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "invalid"
      turn
    end
  end

  def turn_count
    i = 0
    @board.each do |char|
      i = i + 1 if char == "X" || char == "O"
    end
    return i
  end

  def current_player
    turn_num = turn_count
    if turn_num == 0
      return "X"
    else
      if turn_num % 2 == 0
        return "X"
      else
        return "O"
      end
    end
  end

  def won?
    WIN_COMBINATIONS.each { |x|
      if ((@board[x[0]] == "X" && @board[x[1]] == "X" && @board[x[2]] == "X") || (@board[x[0]] == "O" && @board[x[1]] == "O" && @board[x[2]] == "O"))
        return x
      else
        false
      end
    }
    @board.any?{|player| player == "X" || player == "O"}
    if full?
      false
    end
  end

  def full?
    @board.none? { |x|
      x == " " || x == ""
    }
  end

  def draw?
    if full? && !won?
      true
    else
      false
    end
  end

  def over?
    if won? || full?
      true
    else
      false
    end
  end

  def winner
    winner = won?
    if winner.kind_of?(Array)
      return @board[winner[0]]
    else
      nil
    end
  end

  def play
    while !over? do
      turn
      if draw?
        break
      end
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end

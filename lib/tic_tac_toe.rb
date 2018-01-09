WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end


  def move(board, index, current_player)
  board[index] = current_player
end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
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
    WIN_COMBINATIONS.each do |cond|
      term1 = cond[0]
      term2 = cond[1]
      term3 = cond[2]

      p1 = @board[term1]
      p2 = @board[term2]
      p3 = @board[term3]

      if p1 != " " && p1 == p2 && p2 == p3
        return cond
      end
    end
  return false
  end

  def full?
    return !@board.include?(" ")
  end

  def draw?
    if full?
      return !won?
    else false
    end
  end

  def over?
    if full? || won?
      return true
    else false
    end
  end

  def winner
    if won?
      return @board[won?[0]]
    else
      nil
    end
  end

  def play
    until(over?|| draw?)
      turn
    end
    if won?
      symbol = winner
      puts "Congratulations #{symbol}!"
    else
      puts "Cat's Game!"
    end
  end
end

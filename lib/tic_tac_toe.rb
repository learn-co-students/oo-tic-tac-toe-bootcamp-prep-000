class TicTacToe
  def initialize(board = nil)
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
  [6,4,2]
]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index, token="X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8)
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

  def turn_count
      turns = 0
      @board.each do |turn|
        if turn != " "
          turns += 1
        end
      end
      turns
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |win|
      if win.all?{|i| @board[i] == "X"}
        return win
      elsif win.all?{|i| @board[i] == "O"}
        return win
      end
    end
    return false
  end

  def full?
    @board.none? do |token|
      if token == " "
        true
      else
        false
      end
    end
  end

  def draw?
    if won?
      false
    elsif full?
      true
    end
  end

  def over?
    if draw?
      return true
    elsif won?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      WIN_COMBINATIONS.each do |win|
        if win.all?{|i| @board[i] == "X"}
          return "X"
        elsif win.all?{|i| @board[i] == "O"}
          return "O"
        end
      end
    end
    return nil
  end

  def play
    until over?
        turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat\'s Game!"
    end
  end

end

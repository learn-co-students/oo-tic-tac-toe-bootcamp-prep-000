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

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      xwins = combination.all?{|position| @board[position] == "X"}
      owins = combination.all?{|position| @board[position] == "O"}
      if xwins || owins
        return combination
      end
    end
    nil
  end

  def full?
    return @board.none?{|position| position == " "}
  end

  def draw?
    return full? && !won?
  end

  def over?
    return draw? || won?
  end

  def winner
    if won?
      return @board[won?[0]]
    else
      return nil
    end
  end

  def turn_count
    count = 0
    @board.each do |position|
      if position != " "
        count += 1
      end
    end
    count
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def play
    if over?
      if draw?
        puts "Cat's Game!"
      else
        puts "Congratulations #{winner}!"
      end
    else
      turn
      play
    end
  end
end

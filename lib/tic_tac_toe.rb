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

  def input_to_index(input)
    integer_input = input.to_i
    @integer = integer_input - 1
    @integer
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] != " "
      return true
    else
      return false
    end
  end

  def valid_move?(index)
   index.between?(0,8) && !position_taken?(index)
  end

  def current_player
  if turn_count.even?
    return "X"
  else
    return "O"
  end
  end

  def turn_count
    turn = 0
    @board.each do |index|
      if index != " "
        turn +=1
      end
    end
    turn
  end

  def turn
    puts "Enter a number between 1 and 9."
    @input = gets.strip
    @entry = input_to_index(@input)
    if valid_move?(@entry)
      move(@entry, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      @board[combo[0]] == @board[combo[1]] && @board[combo[1]]== @board[combo[2]] && position_taken?(combo[0])
    end
  end

  def full?
      if !@board.include?(" ")
        return true
      else
        return false
    end
  end

  def draw?
  if full? && !won?
    return true
  else
    return false
  end
  end

  def over?
    if draw? || won?
      return true
    else
      return false
    end
  end

  def winner
    if won?
        return @board[won?[0]]
      else
        return nil
    end
  end

  def play
    until over?
      turn
      won?
      draw?
    end
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end
end

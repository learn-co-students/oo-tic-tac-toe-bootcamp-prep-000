class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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
    return input.to_i - 1
  end


  def move(index, player="X")
    @board[index] = player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " " || @board[index] == "")
  end

  def valid_move?(index)
    if index <= 8 && index >= 0
      if position_taken?(index) == false
        return true
      end
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    @index = input_to_index(input)
    @player = current_player
    if valid_move?(@index)
      move(@index, @player)
      display_board
    else
      turn
    end
  end


  def turn_count
    turns_taken = 0
    @board.each do |board|
      if board == "X" || board == "O"
        turns_taken += 1
      end
    end
    return turns_taken
  end

  def current_player
    return turn_count % 2 == 0 ?  "X" :  "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  def full?
    @board.all?{|square| square == "X" || square == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    full? || draw? || won?
  end

  def winner
    if won?
      return @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end

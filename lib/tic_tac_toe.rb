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
    input.to_i - 1
  end

  def move(index, value)
    @board[index] = value
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    elsif @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    end
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) == true
      move(index, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    @board.count{|counter| counter == "X" || counter == "O"}
  end

  def won?
    WIN_COMBINATIONS.detect{|combination|
        @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]] && position_taken?(combination[0])
      }
  end

  def full?
    !@board.any?{ |i| i == " " }
  end

  def draw?
    full? && !won?
  end

  def over?
    draw?  || won?
  end

  def winner
    if combo = won?
      @board[combo[0]]
    end
  end

  def turn_count
    counter = 0
    @board.each{|slot|
      if slot != " "
        counter += 1
      end }
    counter
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end

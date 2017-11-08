class TicTacToe

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

  def initialize
    @board = Array.new(9, " ")
    puts "Welcome to Tic Tac Toe!"
    display_board
  end

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
    if valid_move?(index)
      @board[index] = token
    end
  end


  def position_taken?(index)
    (@board[index] == "X" || @board[index] == "O") ? true : false
  end


  def valid_move?(index)
    (index.between?(0, 8) && !position_taken?(index)) ? true : false
  end


  def turn
    puts "Please enter 1-9:"
    index = input_to_index(gets.strip)
    if move(index, current_player)
      display_board
    else
      turn
    end
  end


  def turn_count
    count = 0
    @board.each do |spot|
      if (spot == "X" || spot == "O")
        count += 1
      end
    end
    return count
  end


  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end


  def won?
    WIN_COMBINATIONS.each do |combo|
      i = @board[combo[0]]
      if (i == "X" || i == "O") && (i == @board[combo[1]] && i == @board[combo[2]])
        return combo
      end
    end
      return false
  end


  def full?
    @board.each do |spot|
      if (spot == " " || spot == "" || spot == nil)
        return false
      end
    end
    return true
  end


  def draw?
    (full? && !won?) ? true : false
  end


  def over?
    (won? || full?) ? true : false
  end


  def winner
    won? ? @board[won?[0]] : nil
  end


  def play
    while !over?
      turn
    end
  end

end

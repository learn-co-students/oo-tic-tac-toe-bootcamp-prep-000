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
    index = input.to_i - 1
  end

  def move(index, char)
    @board[index] = char
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && @board[index] == " "
  end

  def turn_count
    @turns = 0
    @board.each do |index|
      if index == "X" || index == "O"
        @turns += 1
      end
    end
    return @turns
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    char = current_player
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, char)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |array|
      if @board[array[0]] == "X" && @board[array[1]] == "X" && @board[array[2]] == "X" ||
        @board[array[0]] == "O" && @board[array[1]] == "O" && @board[array[2]] == "O"
        return array
       end
    end
    false
  end

  def full?
     @board.all? { |index| index == "X" || "O" }
     !(@board.include?(" " || nil))
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || full? || won? != false
  end

  def winner
    win_combo = won?

    if win_combo == false
      nil
    else
      if @board[win_combo[0]] == "X"
        return "X"
      else
        return "O"
      end
    end
  end

  def play

   while over? == false
      turn
   end

   if draw?
    puts "Cat's Game!"
   elsif won?
    puts "Congratulations #{winner}!"
   end

  end

end

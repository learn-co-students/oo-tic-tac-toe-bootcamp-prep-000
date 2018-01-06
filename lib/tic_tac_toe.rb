class TicTacToe
  WIN_COMBINATIONS = [
   [0,1,2], # Top row
   [3,4,5],  # Middle row
   [6,7,8],  # Bottom row
   [0,3,6],  # First column
   [1,4,7],  # Middle column
   [2,5,8],  # Last column
   [0,4,8],  # Diagonal from top left to bottom right
   [6,4,2]  # Diagonal from bottom left to top right
  ]

  def initialize
    @board = Array.new(9, " ")
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

  def move(index, character)
    @board[index] = character
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if !index.between?(0,9) || position_taken?(index)
      return false
    else
      return true
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)

    if valid_move?(index)
      move(index, current_player)
      display_board
      return
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |space|
      if space != nil && space.strip != ""
        count += 1
      end
    end
    return count
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    combination_moves = []
    won = false

    WIN_COMBINATIONS.each do |combination|

      combination_moves = [@board[combination[0]],
                           @board[combination[1]],
                           @board[combination[2]]]

      won = (combination_moves.all? do |character|
          character == "X" end) ||
          (combination_moves.all? do |character|
          character == "O" end)

      if won
        return combination
      end
    end
    return false
  end

  def full?
    return @board.all? do |space|
      space != " " && space != nil
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    full?|| draw?|| won?
  end

  def winner
    winning_combo = won?

    if winning_combo
      return @board[winning_combo[0]]
    else
      return nil
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end # end TicTacToe Class

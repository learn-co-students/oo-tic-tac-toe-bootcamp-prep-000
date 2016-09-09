class TicTacToe
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  WIN_COMBINATIONS = [
    [0,1,2],  # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # Vertical left
    [1,4,7],  # Vertical middle
    [2,5,8],  # Vertical right
    [0,4,8],  # Diagonal
    [2,4,6]   # Diagonal
  ]

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(input, value = "X")
    index = input - 1
    @board[index] = value
  end

  def valid_move?(input)
    if input == "invalid"
      false
    else
      index = input.to_i - 1
      !position_taken?(index) && input.to_i.between?(1,9)
    end
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

# this is where we determine the integer index 0 to 8 from the input
  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    value = current_player
    if valid_move?(input)
      input = input.to_i
      move(input, value)
      display_board
    else
      puts "invalid"
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each { |spot| counter += 1 if spot == "X" || spot == "O" }
    counter
  end

#attention self
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def full?
    @board.all?{|i| i == "X" || i == "O" } ? true : false
  end

  def won?
    if @board.none?{|i| i == "O" || i == "X" }
      #empty board
      false
    elsif
      WIN_COMBINATIONS.each do |win_combination|
        position_1 = @board[win_combination[0]]
        position_2 = @board[win_combination[1]]
        position_3 = @board[win_combination[2]]
          if ( (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O") )
            return [win_combination[0], win_combination[1], win_combination[2]]
          end
      end
    elsif @board.full?
      false
    end
  end

  def draw?
    if !won? && full?
      true
    else
      false
    end
  end

  def over?
    true if won? || draw? || full?
  end

#self
  def winner
    if won?
      win_combination = won?
      return @board[win_combination[1]]
    else
      nil
    end
  end

end

class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle Row
    [6,7,8], # Bottom Row
    [0,3,6], # Left Column
    [1,4,7], # Middle Column
    [2,5,8], # Right Column
    [0,4,8], # Left to Right
    [2,4,6]  # Right to Left
  ]

  def display_board
    puts " #{@board[0]} ""|"" #{@board[1]} ""|"" #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} ""|"" #{@board[4]} ""|"" #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} ""|"" #{@board[7]} ""|"" #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, c_player = "X")
    @board[index] = c_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
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
    current_turn = 0
    @board.each do |play|
      if play == "X" || play == "O"
        current_turn += 1
      end
    end
   current_turn
  end

  def current_player
    if !turn_count.odd?
      player = "X"
    else
      player = "O"
    end
    player
  end

  def won?
    WIN_COMBINATIONS.detect { |wins|
      win_index_1 = wins[0]
      win_index_2 = wins[1]
      win_index_3 = wins[2]

      @position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

    if @position_1 == "X" && position_2 == "X" && position_3 == "X"
      return wins
    elsif @position_1 == "O" && position_2 == "O" && position_3 == "O"
      return wins
    else
      false
    end
    }

  end

  def full?

    if @board.any? { |e| e == " " }
      return false
    else
      return true
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
    if won?
      true
    elsif draw?
      true
    elsif full?
      true
    else
      false
    end
  end

  def winner
    if won?
      return @position_1
    else
      nil
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

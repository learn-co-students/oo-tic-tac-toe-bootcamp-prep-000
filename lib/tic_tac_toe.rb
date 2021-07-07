class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # First vertical row
    [1,4,7],  # Second verical row
    [2,5,8],  # Last vertical row
    [0,4,8],  # Diagonal from top left
    [2,4,6]  # Diagonal from bottom left
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
    greet
  end

  def greet
    puts "Welcome to Tic Tac Toe!"
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if(valid_move?(index))
      move(index,current_player)
      display_board
    else
      turn
    end
  end

  def valid_move?(index)
    if index.between?(0,8) && !(position_taken?(index))
      true
    else
      false
    end
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def input_to_index(choice)
    return choice.to_i - 1
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X")
        return win_combination
      elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      else
        false
      end
    end
    false
  end

  def full?
    return @board.none? {|position| position == " "}
  end

  def draw?
    if(!won? && full?)
      return true
    else
      return false
    end
  end

  def over?
    if(full? || draw? || won?)
      return true
    else
      return false
    end
  end

  def winner
    if((won?).kind_of?(Array))
      return @board[(won?)[0]]
    end
  end

  def play
    until(over?)
      turn
    end

    if(draw?)
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

end

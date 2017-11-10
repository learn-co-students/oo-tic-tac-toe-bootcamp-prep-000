class TicTacToe


  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]
  ]

  def initialize
    puts "Welcome to TicTacToe!"
    @board = Array.new(9, " ")
    display_board
  end

  def display_board
     board_game_division = "-----------"
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} ",
          board_game_division,
          " #{@board[3]} | #{@board[4]} | #{@board[5]} ",
          board_game_division,
          " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index
     num = @input.to_i
     @index = num - 1
   end

  def move
     @board[@index] = @value
  end

  def valid_move?
    if position_taken? == @index.between?(0, 8)
      return false
    else
      return true
    end
  end

  def position_taken?
    if @board[@index] == " " || @board[@index] == "" || @board[@index] == nil
      return false
    else
      return true
    end
  end

  def turn
    puts "Please enter 1-9:"
    @input = gets.strip
    @index = input_to_index
    @value = current_player
    if valid_move?
      move
      display_board
    else turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |plays|
      if plays == "X" || plays == "O"
        counter += 1
      end
      end
      return counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |winning_array|
    if (winning_array.all?{|index| @board[index] == "X"}) || (winning_array.all?{|index| @board[index] == "O"})
      return winning_array
    end
  end
  return false
  end

  def full?
  if @board.all?{|includes| includes == "X" || includes == "O"}
    return true
  else
    return false
  end
  end

  def draw?
  if won? != false
    return false
  elsif full? == true
    return true
  else
    return false
  end
  end

  def over?
    if (draw? == true) || (full? == true) || (won? != false)
      return true
    else
      return false
    end
  end

  def winner
    if won? != false
      return @board[won?[0]]
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
    end
    if draw?
      puts "Cat's Game!"
  end
  end
end

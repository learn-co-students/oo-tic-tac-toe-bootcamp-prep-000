#learn open oo-tic-tac-toe-bootcamp-prep-000
class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], #top_row_win
    [3,4,5], #mid_row_win
    [6,7,8], #bot_row_win
    [0,3,6], #left_colom_win
    [1,4,7], #mid_colom_win
    [2,5,8], #right_colom_win
    [0,4,8], #top_left_bot_right_diagonla_win
    [2,4,6]  #top_right_bot_left_diagonla_win
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
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
      current_playerXorO = current_player
      move(index , current_playerXorO)
      display_board
    else
      turn
    end
  end

  # Define your play method below
  def play
    i=0
    while i < 9
      if(won? != false || (full? && won?))
        puts "Congratulations #{winner}!"
        return
      elsif(draw?)
        puts "Cat's Game!"
        return
      elsif(!over?)
        turn
      end
      i += 1
    end
  end

  def won?
    WIN_COMBINATIONS.each { |win_com|
    if(win_com.all? {|index| @board[index] == "X" || @board[index] == "x"})
      return win_com
    elsif(win_com.all? {|index| @board[index] == "O" || @board[index] == "o"})
      return win_com
    end
    }
    return false
  end

  def full?
    @board.each { |element|
      if( element == nil || element == " " || element == "")
        return false
      end
    }
    return true
  end

  def draw?
    full = full?
    won = !won?
    if(won && full)
      return true
    end
    return false
  end

  def over?
    if((full? && won?) || draw?)
      return true
    end
  end

  def winner
    WIN_COMBINATIONS.each { |win_com|
    if(win_com.all? {|index| @board[index] == "X" || @board[index] == "x"})
      return "X"
    elsif(win_com.all? {|index| @board[index] == "O" || @board[index] == "o"})
      return "O"
    end
    }
    return nil
  end
end

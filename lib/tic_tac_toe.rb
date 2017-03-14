class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i-1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(position)
    @board[position] != " " && @board[position] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn()
    puts "Please enter 1-9:"
    index = input_to_index(gets.strip)
    if valid_move?(index)
      move(index, current_player())
      display_board()
    else
      turn()
    end
  end

  def won?
    WIN_COMBINATIONS.each{ |win_combination|
    win_temp_var_X=0
    win_temp_var_O=0
      win_combination.each{ |win_val|
        if (@board[win_val]=="X")
          win_temp_var_X+=1
        elsif (@board[win_val]=="O")
          win_temp_var_O+=1
        end
      }
      return win_combination if (win_temp_var_X==3 || win_temp_var_O==3)
    }
    return nil
  end

  def full?
    @board.each{|x|
      return false if x == " "
    }
    return true
  end

  def draw?
    return true if(!won?() && full?())
    return false
  end

  def over?()
    return !!(won?()|| draw?())
  end

  def winner
    return @board[won?()[0]] if (!!(won?()))
    return nil if (draw?())  #unnecessary
  end

  def play()
    until over?()
      turn()
    end

    puts "Congratulations #{winner()}!" if won?()
    puts "Cat's Game!" if draw?()
  end

end

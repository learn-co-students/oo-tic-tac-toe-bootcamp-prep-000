class TicTacToe

  #InstnaceVariable
def initialize
  @board = [" "," "," "," "," "," "," "," "," "]
end



#WIN_COMBINATIONS
WIN_COMBINATIONS = [
  [0, 1, 2], #top_row_win
  [3, 4, 5], #middle_row_win
  [6, 7, 8], #bottom_row_win
  [0, 3, 6], #left_column_win
  [1, 4, 7], #middle_column_win
  [2, 5, 8], #right_column_win
  [0, 4, 8], #left_diag_win
  [6, 4, 2] #right_diag_win
]


#InstanceMethods

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n-----------\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n-----------\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
end


def input_to_index(input)
  input.to_i - 1
end



def move(index, player_token)
    #player_token = current_player(board)
    @board[index] = player_token
  end


  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if !position_taken?(index) && checkSpace(index)
      return true
    else
      return false
    end
  end


  def checkSpace(index)
    if index == 0
      return true
    elsif index == 1
      return true
    elsif index == 2
      return true
    elsif index == 3
      return true
    elsif index == 4
      return true
    elsif index == 5
      return true
    elsif index == 6
      return true
    elsif index == 7
      return true
    elsif index == 8
      return true
    else
      return false
    end
  end

  def turn_count
     count = 0
     @board.each do |turn|
       if turn == "X" || turn == "O"
         count+= 1
       end
     end
     return count
   end


   def current_player
     if turn_count % 2 != 0
       return "O"
     else
       return "X"

     end
   end


   def turn

     puts "Please enter 1-9:"
     input = gets.strip
     input = input_to_index(input)
     #player_token = current_player()

     if !valid_move?(input)
           turn
       end
       move(input, current_player)
       display_board
    end

def won?

  if WIN_COMBINATIONS.each do |win|
     if win.all? {|x| @board[x] == "X"}
        return win

     elsif win.all? {|o| @board[o] == "O"}
        return win
     end
   end
     else
        return false
      end
    end


def full?
  @board.all? {|filled| filled == "X" || filled == "O"}
end



def draw?
  if won? && full? || !full?
    return false
  else
    return true
  end
end


def over?
  if draw? || won?
    return true
  else
    false
  end
end


def winner
  x_won = []
  o_won = []

  @board.each do |count|
      if count == "X"
        x_won << count
      elsif count == "O"
        o_won << count
      end
  end

  if o_won.length > x_won.length
    return "O"

  elsif (x_won.length > o_won.length) && won? != false
    return "X"

  else
    return nil

  end
end


def play
#loops until the game is over
  while !over?
    turn
  end
#When game is over, it tells players who won (or whether it was a draw)
  if over?
    if draw?
      puts"Cat's Game!"

    elsif winner == "X"
          puts "Congratulations X!"

      else
          puts "Congratulations O!"
        end
    end
end





end

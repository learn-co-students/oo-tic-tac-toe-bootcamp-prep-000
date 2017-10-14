class TicTacToe
  def initialize
     @board = Array.new(9, " ")
    end

WIN_COMBINATIONS=[
  [0,1,2], #top horizontal win
  [3,4,5], #Middle horizontal win
  [6,7,8], #Bottomr horizontal win
  [0,3,6], #Left Vert win
  [1,4,7], #Middle Vert win
  [2,5,8], #Right Vert Win
  [0,4,8], #Diagonal win
  [2,4,6] #Diagonal win
  ]


  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

    def move(index, current_player = "X")
       @board[index] = current_player
     end

def position_taken?(index)
  @board[index] != " "
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn_count
  @board.count{|square| square != " "}
end

def current_player
  turn_count.even? ? "X" : "O"
end

  def turn
     puts "Where would you like to place your token? [1-9]"
     user_input = gets.strip
     index = input_to_index(user_input)
     if valid_move?(index)
       token = current_player
       move(index, token)
     else
       turn
     end
     display_board
   end



     def won?
        result = false
        WIN_COMBINATIONS.each do |winning_combination|
            if winning_combination.all? {|i| @board[i] == "X"} || winning_combination.all?{|i| @board[i] == "O"}
              result = winning_combination
            end
          end
        return result
      end


 def full?
   @board.all?{|square| square != " "}
 end

 def draw?
full? && !won?
  end

  def over?
     won? || draw?
   end

   def winner
    if over?
      if won?
        return @board[won?[0]]
      else
        return nil
      end
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

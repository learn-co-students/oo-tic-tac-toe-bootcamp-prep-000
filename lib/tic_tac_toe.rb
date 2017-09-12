class TicTacToe
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[2,5,8],[0,4,8],[2,4,6],[1,4,7]]
  def initialize (board = Array.new(9, " "))
    @board = board
  end

  def display_board #sorted
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts (print "-----------")
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts (print "-----------")
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def won?

    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = @board[win_combination[0]]
      win_index_2 = @board[win_combination[1]]
      win_index_3 = @board[win_combination[2]]

      if win_index_1 == win_index_2 && win_index_2 == win_index_3 && win_index_1 != " "
        return win_combination
      end
    end
    return false
  end

    def input_to_index (input) #sorted
      @input = input
      @input = input.to_i - 1
      return @input
    end

    def move (index, token)
   @index = index
   @token = token
   @board[@index] = @token
 end

 def position_taken?(index)
    @index = index
    if @board[@index] == "X" || @board[@index] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(index)
   @index = index
   position_taken?(@index) == false && @index.between?(0,8) ? true : false
end

def turn_count #sorted
    (@board.select{|number| number == "X" || number == "O"}).length

 end

 def current_player #sorted
   if turn_count % 2 == 0
     return "X"
 end
 return "O"
end

def turn
 puts "Please enter 1-9:"
 input = input_to_index(gets.strip)
 if valid_move?(input)
   move(input, current_player)
   display_board
 else
   turn
 end
end

def full?
   @board.all?{|number| number == "X" || number == "O"}
 end

 def draw?
   if full? == true && won? == false
     return true
 end
 return false
end

def over?
   draw?|| won? ? true : false
 end

 def winner
    the_winner = won?
    if the_winner
      return @board[the_winner[0]]
    end
  end

  def play
    while over? == false
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    end
    puts "Cat's Game!"
  end

end

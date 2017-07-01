class TicTacToe
  WIN_COMBINATIONS=[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    @index = input.to_i - 1
  end

  def move(index,character="X")
    @board[index] = character
  end

  def position_taken?(index)
    if (@board[index] == " " || @board[index] == "")
      return false
    else
      return true
    end
  end

  def valid_move?(index)
    if (index < 0 || index > 8)
      return false
    elsif (position_taken?(index))
      return false
    else
      return true
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
   turn_count % 2 == 0 ? "X" : "O"
 end

 def turn
   puts "Please enter 1-9:"
   inp = gets.strip
   index = input_to_index(inp)
   if (valid_move?(index))
     move(index,current_player)
     display_board
     return true
   else
#     binding.pry
     turn
   end
 end

def won?
  x_plays = []
  o_plays = []
  counter = 0
  @board.each do |play|
      if (play.include? "X")
        x_plays << counter
      elsif (play.include? "O")
        o_plays << counter
      end
      counter = counter + 1
    end

    WIN_COMBINATIONS.each do |win|
      if  (x_plays.detect {|play| play == win[0]}) && (x_plays.detect {|play| play == win[1]}) && (x_plays.detect {|play| play == win[2]})
        return win
      elsif  (o_plays.detect {|play| play == win[0]}) && (o_plays.detect {|play| play == win[1]}) && (o_plays.detect {|play| play == win[2]})
        return win
      end
    end
    return false
  end

  def full?
    if (@board.detect{|i| i.include?(" ")})
      return false
    else
      return true
    end
  end

  def draw?
    if ((full?) && (!won?))
      return true
    else
      return false
    end
  end

  def over?
    if (draw?)
      return true
    elsif (won?)
      return true
    else
      return false
    end
  end

  def winner
    i = won?
    if (i)
      return @board[i[0]]
    end
  end

  def play
    while (!over?)
      turn
    end
    if (draw?)
      puts "Cat's Game!"
      return
    elsif (won?)
        print_out = winner #just using this to figure out if winner is X or O
        puts "Congratulations #{print_out}!"
        return
    end
  end

end

class TicTacToe

  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board

end



WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def input_to_index(input)
  input.to_i - 1
  end

  def display_board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
       counter = 0
     @board.each do |turn|
       if turn == "X" || turn == "O"
      counter += 1
  end
  end
  return counter
  end

  def current_player
    if turn_count.even? == true
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input =gets.strip
    index = input_to_index(input)
    if valid_move?(index) == true
      move(index, current_player)
    else
      turn
    end
    display_board
  end

  def won?
      WIN_COMBINATIONS.each do |wincombo|
    if (@board[wincombo[0]]) == "X" && (@board[wincombo[1]]) == "X" && (@board[wincombo[2]]) == "X"
      return wincombo
    elsif (@board[wincombo[0]]) == "O" && (@board[wincombo[1]]) == "O" && (@board[wincombo[2]]) == "O"
      return wincombo
    end
    end
      return false
  end

  def full?
     @board.all? {|spot| spot if spot == "X" || spot == "O"}
   end


   def draw?
      won? == false && full? == true
    end

    def over?
      if won? != false
        return true
      elsif draw? == true
        return true
      else
        return false
      end
    end

    def winner
      if win_combo = won?
        index = win_combo[0]
        return @board[index]

    end
    end

    def play
      until over? == true
        turn
      end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
end
end

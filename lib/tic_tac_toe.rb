class TicTacToe
  def initialize(board = nil)
      @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # 1 Top row
    [3,4,5], # 2 Middle row
    [6,7,8], # 3 Bottom row
    [0,3,6], # 4 First column
    [1,4,7], # 5 Second column
    [2,5,8], # 6 Third column
    [0,4,8], # 7 Right slope diagonal
    [2,4,6]  # 8 Left slop diagonal
  ]

  def input_to_index(user_input)
    @input=user_input.to_i - 1
  end

  def move(index,token="X")
    @board[index] = current_player
  end

  def position_taken? (index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    else true
    end
  end

  def valid_move? (index)
    if position_taken?(index) == false && index.between?(0, 8) == true
      true
    else false
    end
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
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
    puts current_player
    user_input = gets.strip
    index = input_to_index(user_input)
    token = current_player
    if valid_move?(index) == true
      move(index,token="X")
      display_board
    else
      puts "Invalid move"
      display_board
      turn
    end
  end

  def won?
    win_elements=[]
    board_elements = []
    WIN_COMBINATIONS.each do |win_combination|
      board_elements = []
      win_elements = []
      win_combination.each do |index|
        board_elements << @board[index]
        win_elements << index
      end
      if (board_elements.all?{|c| c == "X"} ==  true) || (board_elements.all?{|c| c == "O"} ==  true)
        #win_elements
        break
      else
        win_elements = false
      end
    end

    return win_elements
   end

   def full?
     @board.all? do |index|
       index == "X" || index == "O"
     end
   end

   def draw?
     if (full? == true) && (won? == false)
       return true
     else
       return false
     end
   end

   def over?
     if (draw? == true) || (won? != false)
       return true
     else
       return false
     end
   end


   def winner
     win_array = []
     board_win_array = []
     if won? != false
       win_array = won?
       win_array.each do |index|
         board_win_array << @board[index]
       end
       if (board_win_array.all?{|c| c == "X"} == true)
         return "X"
       elsif (board_win_array.all?{|c| c == "O"} == true)
         return "O"
       else
         nil
       end
     end
   end

   def play
     if over? == false
       turn_count
       turn
       play
     elsif (over? == true)
       if (draw? == false)
         puts "Congratulations #{winner}!"
       elsif (draw? == true)
         puts "Cat's Game!"
       end
     end
   end

end

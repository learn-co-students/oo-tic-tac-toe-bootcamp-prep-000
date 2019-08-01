class TicTacToe
  
  def initialize(board = nil)
     @board = board || Array.new(9, " ")
  end

   WIN_COMBINATIONS =[
    [0,1,2], 
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
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

   def move(index, player)
    @board[index] = player
  end

   def position_taken?(location)
    @board[location] != " " && @board[location] != "" && @board[location] != nil
  end

   def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end


   def turn_count
    @board.count{|el| el != " " && el != "" && el != nil}
  end

   def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

   def turn
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      if valid_move?(index)

         player = current_player
        move(index, player)
        display_board
      else
        turn
      end
  end

   def won?
    WIN_COMBINATIONS.each do |el| #[0, 1 ,2]
    win_position_1 = el[0]
    win_position_2 = el[1]
    win_position_3 = el[2]

       if @board[win_position_1] == @board[win_position_2] && @board[win_position_2] == @board[win_position_3] && @board[win_position_1] != " "
        return el
      end
    end
    false
  end

   def full?
    @board.none?{|el| el == " " || el == "" || el == nil}
  end

   def draw?
    if full? == true && won? == false
      true
    end
  end

   def over?
    if full? == true || won? != false || draw? == true
      true
    end
  end

   def winner
    if won? != false
      (@board[won?[0]])
    end
  end

   def play
    until over? == true
      turn
    end

     if won? != false
      puts "Congratulations #{winner}!"
    elsif draw? == true
      puts "Cat's Game!"
    end
  end
end
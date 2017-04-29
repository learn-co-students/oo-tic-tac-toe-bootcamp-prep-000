class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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

  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
  ]
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, current_player = "X")
    @board[index] = current_player
    display_board
  end
  
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
    else
      turn
    end
  end
  
  $x = []
  def won?
    y = []
    WIN_COMBINATIONS.each do |win_combo| # ex [0,1,2]
      if win_combo.all?{|i| @board[i] == "X"} || win_combo.all?{|i| @board[i] == "O"}
         y = win_combo
         break
      else
         y = false
      end
    end
    $x = y
    return y 
  end


  def full?
    if @board.none?{|i| i == " "}
      true
    else
      false
    end
  end
  
  def over?
    if draw? || won? != false
      true
    else
      false
    end
  end
  
  def draw?
    if won? == false && full? == true
      true
    elsif full? == false
      false
    end
  end
  
  def winner
    if won? != false
      if $x.all?{|i| @board[i] == "X"}
        "X"
      elsif $x.all?{|i| @board[i] == "O"}
        "O"
      end
    end
  end
  
  def play
    until over? == true
      turn
    end
    if draw? == true
      puts "Cat's Game!"
    elsif won? != false
      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      end
    end
  end  
end


  


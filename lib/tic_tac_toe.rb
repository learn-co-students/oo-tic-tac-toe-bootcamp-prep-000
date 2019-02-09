class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    if user_input.is_a?Array
      user_input_int = user_input.join.to_i
    else
      user_input_int = user_input.to_i
    end  
    return -1 if user_input.length > 1
    user_input_int - 1
  end 
  
  def move(position, player = "X")
    if @board[position] == " "
      @board[position] = player
    else
      puts "position already taken, next player please"
    end
    @board
  end  
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    index.between?(0, 8) && !(position_taken?(index))
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    input_as_index = input_to_index(input)
    if ! valid_move?(input_as_index) 
      turn
    else
      move(input_as_index, current_player)
      display_board
    end  
  end
  
  def turn_count 
    @board.count {|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count.even? ?  "X" : "O"
  end
  
  def won?
    win_combination = []
    winner = []
    WIN_COMBINATIONS.each do |combination|
      if position_taken?(combination[0]) && position_taken?(combination[1]) && position_taken?(combination[2]) && @board[combination[0]] == @board[combination[1]] && @board[combination[0]] == @board[combination[2]]
         win_combination << combination
         winner << @board[combination[0]]
      end   
    end
    win_combination.length == 1 || (win_combination.length == 2 && winner[0] == winner[1])? win_combination[0] : nil
  end
  
  def full?
    count = 0
    @board.each.with_index do |position, index| 
      if position_taken?(index) 
        count += 1
      end  
    end
    count == 9 ? true : false
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    won?|| draw?
  end
  
  def winner
    won? ? @board[won?[0]] : nil
  end
  
  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    else
      
    end  
  end  

end  
class TicTacToe 

  def initialize
    @board = Array.new(9, " ")
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
    user_input.to_i - 1
  end
  
  def move(index, current_player )
  @board[index] = current_player
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
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
      display_board
    else
      turn
    end
  end
  
  def turn_count
    counter = 0
    @board.each do |board_element|
      if ("#{board_element}" == "X" || "#{board_element}" == "O")
        counter += 1
      end
    end
    counter
  end
  
  def current_player
    turn_count.even? ? player = "X" : player = "O"
    player
  end
  
  def full?
  @board.none? { |value| value == " " }
  end
  
  def draw?
    status = ""
    if won? == false && full? == true
        status = true
      else 
       status = false
     end
     status
   end
    
  def over?
    status = false
    if won? != false || draw? == true || full? == true
        status = true
    end
    status
  end

  def winner
    if won? != false
      @board[won?[0]]
    end
  end
  
  def won?
     result = false
     WIN_COMBINATIONS.each do |win_combination|
          win_index_1 = win_combination[0]
          win_index_2 = win_combination[1]
          win_index_3 = win_combination[2]
          position_1 = @board[win_index_1]
          position_2 = @board[win_index_2]
          position_3 = @board[win_index_3]
      
          if position_1 == "X" && position_2 == "X" && position_3 == "X" 
              result = win_combination
            elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
              result = win_combination
            else 
          end
      end
      
      result
    
    end
  
  def play
  while over? == false
    turn
  end
  if won? != false
    puts "Congratulations #{winner}!"
  elsif draw? == true
    puts "Cat's Game!"
  end
  end

end
class TicTacToe

  def initialize 
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  

  
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
  
  def move(index, token = "X")
    @board[index] = token
  end


  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    if valid_move?(index)
      move(index, token)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    counter = 0
    @board.each do |token|
      if token == "X" || token == "O"
      counter += 1
      end
    end
    counter
  end
  
  def current_player
    turn_count.even? ? "X" : "O"
  end
  
  def won?
    winner = false
    WIN_COMBINATIONS.each do |win_combo|
      if @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]] && position_taken?(win_combo[0])
        winner = win_combo
      end
    end  
    winner
  end

  def full?
    !@board.any? { |position| position == " " }
  end
  
  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end
  
  def over?
    if won? || full? || draw?
      return true
    else
      return false
    end
  end
  
  def winner
    if won?
      win_set = won?
      return @board[win_set[0]]
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
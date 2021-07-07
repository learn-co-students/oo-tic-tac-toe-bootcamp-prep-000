class TicTacToe
  def initialize
    board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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
    [2,4,6]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    index_value = input.to_i - 1
    return index_value
  end
  
  def move(index_value,current_player)
    @board[index_value] = current_player
    return @board
  end
  
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    else
      return true
    end
  end
  
  def valid_move?(index)
    if !(position_taken?(index)) && index.between?(0,8)
      return true
    else
      return false
    end
  end
  
  def turn
  
    if over? != true
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)

    
      if valid_move?(index)
        move(index,current_player)
        display_board
        return @board
      else
        return turn
      end
    end
  end
  
  def turn_count
    counter = 0
    @board.each do |element|
      if element == "X" || element == "O"
        counter += 1
      end
    end
    return counter
  end
  
  def current_player
    counter = turn_count
    if counter % 2 == 0
      player = "X"
      return player
    else
      player = "O"
      return player
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |element|
      windex_1 = element[0]
      windex_2 = element[1]
      windex_3 = element[2]
  
      position_1 = @board[windex_1]
      position_2 = @board[windex_2]
      position_3 = @board[windex_3]
  
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return [windex_1,windex_2,windex_3]
      end
    
      if position_1 == "O" && position_2 == "O" && position_3 == "O"
        return [windex_1,windex_2,windex_3]
      end
    
    end
  
    return false
  
  end
  
  def full?
    @board.all? do |place|
      place.include?("X") || place.include?("O")
    end
  end
  
  def draw?
    if won? != false
      return false
    elsif full? == true
      return true
    else
      return false
    end
  end
  
  def over?
    if won? != false || full? == true || draw? == true
      true
    else
      false
    end
  end
  
  def winner
    if won? == false
      return nil
    end
  
    winning_spots = won?
    winner_value = winning_spots[0]
    return @board[winner_value]
  end
  
  def play
    counter = 0
    while counter < 9
    
      if won? != false
        puts "Congratulations #{winner}!"
        break
      end
      
      if draw? == true
        puts "Cat's Game!"
        break
      end
    
      counter += 1
      turn
    end
  end
  
  
  
end
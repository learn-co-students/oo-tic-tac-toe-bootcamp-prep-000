class TicTacToe
  
  WIN_COMBINATIONS = [[0,1,2],
                    [3,4,5],
                    [6,7,8],
                    [0,3,6],
                    [1,4,7],
                    [2,5,8],
                    [0,4,8],
                    [2,4,6]]
  
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


  def input_to_index(user_input)
    user_input.to_i - 1
  end


  def move(index, current_player)
    @board[index] = current_player
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
      display_board
    else
      turn
    end
  end


  def turn_count
    turn = 0
    @board.each do |space|
      if space.strip == "X" || space.strip =="O"
        turn += 1
      end
    end
   return turn
  end
  
  def current_player
    return turn_count.even? ? "X" : "O"
  end
  
  def get_locations(player = "X")
    locations = []
    location = 0 
    while(location < 9) do
      if @board[location].strip == player.strip
        locations << location
      end
      location += 1 
      end
    return locations
  end
  
  def won?
    x_locations = get_locations
    y_locations = get_locations("O")
    locations = [x_locations,y_locations]
    WIN_COMBINATIONS.each do |combination|
      locations.each do |location|
        win = location.detect{|a| a == combination[0]} != nil && location.detect{|a| a == combination[1]} != nil && location.detect{|a| a == combination[2]} != nil
        if win then
          return combination
        end
      end
    end
    return FALSE
  end
  
  
  def full?
    return @board.detect{|a| a == " " || a == "" || a == nil} == nil
  end
  
  def draw?
    return !(won?) && (full?)
  end
  
  def over?
    return draw? || won? || full?
  end
  
  def winner
    winLocation = won?
    return winLocation ? ((get_locations.detect{|a| a == winLocation[0]} != nil && get_locations.detect{|a| a == winLocation[1]} != nil && get_locations.detect{|a| a == winLocation[2]} != nil) ? "X" : "O")  : nil
  end
    
  def play
  while !(over?) do
    turn
  end
  if won? then
    puts "Congratulations #{winner}!"
  elsif draw? then
    puts "Cat's Game!"
  end
end  
  
end
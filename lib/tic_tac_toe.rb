class TicTacToe
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
    
  def initialize(board=Array.new(9, " "))
    @board = board
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    index = input.to_i - 1
    return index
  end
  
  def move(index, token)
    @board[index] = token
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    if(index.between?(0, 8) && !position_taken?(index))
      return true
    else
      return false
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    
    token = current_player
    
    if(valid_move?(index))
      move(index, token)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    count = 0
    @board.each do |space|
      if (space == " " || space == "" || space == nil)
        nil
      else
        count += 1
      end
    end
    
    return count
  end
  
  def current_player
    count = turn_count
    if( count.even? )
      return "X"
    else
      return "O"
    end
  end
  
  def won?
    if( @board.all?{|i| i == " "} )
      false
    else
      WIN_COMBINATIONS.each do |combo|
        if( (@board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X") ||
            (@board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O") )
          return combo
        end
      end
      false
    end
  end
  
  def full?
    @board.all?{|i| i == "X" || i == "O" }
  end
  
  def draw?
    if( full? == true && won? == false )
      return true
    else
      false
    end
  end
  
  def over?
    if(draw? == true || (won?))
      return true
    else
      false
    end
  end
  
  def winner
    if(draw? == over?)
      nil
    else
      index = won?
      if(@board[index[0]] == "X" && @board[index[1]] == "X" && @board[index[2]] == "X")
        return "X"
      elsif(@board[index[0]] == "O" && @board[index[1]] == "O" && @board[index[2]] == "O")
        return "O"
      end
    end
  end

  def play
    until (over?)
      turn
    end
    
    if(won?)
      puts "Congratulations #{winner}!"
    elsif(draw?)
      puts "Cat's Game!"
    end
  end
end
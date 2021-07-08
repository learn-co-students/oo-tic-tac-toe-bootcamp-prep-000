class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end 
  
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
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
  
  def move(index, current_player = "X")
    @board[index] = current_player
  end
  
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  
  def valid_move?(index)
    index.between?(0,8) && !self.position_taken?(index)
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = self.input_to_index(input)
    if self.valid_move?(index)
      self.move(index, current_player())
      self.display_board
    else
      self.turn
    end
  end
  
  def turn_count
    count = 0
    @board.each do |ele|
      if ele == "X" || ele == "O"
        count += 1
      end 
    end
    return count
  end
  
  def current_player
    turn = self.turn_count
    str = turn % 2 == 0 ? "X" : "O" 
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
    
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
    
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
  
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination 
      end
    end
    return false;
  end
  
  def full?
    @board.all? do |ele|
      ele == "X" || ele == "O"
    end
  end
  
  def draw?
    if self.full? && !self.won?
      return true
    else 
      return false
    end
  end
  
  def over?
    if self.draw? || self.won?
      return true
    else 
      return false
    end
  end
  
  def winner
    if self.won?
      return @board[self.won?[0]]
    end
  end
  
  def play
    until self.over?
      self.turn
    end
  
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end
end 
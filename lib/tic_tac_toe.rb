class TicTacToe
  def initialize(board=[" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board=board
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
    index = input.to_i - 1
  end
  
  def move(index, token="X")
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    count = 0
    @board.each do |slot|
      if slot == "X" || slot == "O"
        count += 1
      end
    end
    return count
  end
  
  def current_player
    turn_count%2 == 0? "X" : "O"
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player) #this uses another function as an input, which is I think is OK
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combo|
      index_1 = win_combo[0]
      index_2 = win_combo[1]
      index_3 = win_combo[2]
      pos_1 = @board[index_1]
      pos_2 = @board[index_2]
      pos_3 = @board[index_3]
      if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
        return win_combo
      elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
        return win_combo
      end
    end
    return false
  end
  
  def full?
    @board.none?{|pos| pos == " " || pos == ""}
  end
  
  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end
  
  def over?
    if won? || draw?
      return true
    else
      return false
    end 
  end
  
  def winner
    if won?
      return @board[won?[0]]
    else
      return nil
    end
  end
  
  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
  
end
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
    [6, 4, 2],
    [0, 4, 8]
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
      puts "Please enter 1-9:"
      turn
    end
  end
  
  def turn_count
    counter = 0
    @board.each do |pos|
      if pos == "X" || pos == "O"
        counter += 1
      end
    end
    return counter
  end
  
  def current_player
    turn = turn_count
    if turn % 2 == 0
      return "X"
    else
      return "O"
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      
      if (position_1 == "X" && position_2 == "X" && position_3 == "X")
        return [win_index_1, win_index_2, win_index_3]
      elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return [win_index_1, win_index_2, win_index_3]
      end
    end
    return false
  end
  
  def full?
    @board.all? do |position|
      position == "X" || position == "O"
    end
  end
  
  def draw?
    if won?
      return false
    elsif full?
      return true
    else
      return false
    end
  end
    
  def over?
    if won?
      return true
    elsif draw?
      return true
    else
      return false
    end
  end
    
  def winner
    if won?
      getWinner = won?
      getWinnerIndex = getWinner[0]
      return @board[getWinnerIndex]
    else
      return nil
    end
  end
  
  def play
    until over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
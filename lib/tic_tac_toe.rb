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
  
  def move(index, player_token)
    @board[index] = player_token
  end
  
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    counter = 0
    @board.each do |item|
      if item != " " && item != ""
        counter = counter + 1
      end
    end
    return counter
  end
  
  def current_player
    player = "X"
    turns = turn_count
    if turns % 2 == 1
      player = "O"
    end
    return player
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      player_token = current_player
      move(index, player_token)
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
        return combo
      end
      if @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
        return combo
      end
    end
    return false
  end
  
  def full?
    @board.all? do |number|
      number != " "
    end
  end
  
  def draw?
    if won? == false && full? == TRUE
      return true
    else
      return false
    end
  end

  def over?
    if won? != false || draw? == true || full? == true
      return TRUE
    else
      return false
    end
  end
  
  def winner
    if won? == false 
      return nil
    else 
      combo = won?
      return @board[combo[0]]
    end
  end
  
  def play
    while over? == false
      turn
    end
    if draw? == TRUE
      puts "Cat's Game!"
    end
    if won? != false
      game_winner = winner
      puts "Congratulations #{game_winner}!"
    end
  end
end
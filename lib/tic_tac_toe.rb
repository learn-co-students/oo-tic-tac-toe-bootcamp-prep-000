class TicTacToe
  
  def initialize()
    @board = [" "]*9
  end
  
  def board
    @board
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  WIN_COMBINATIONS = [[0,1,2],[0,3,6],[0,4,8],[1,4,7],[2,4,6],[2,5,8],[3,4,5],[6,7,8]]
  
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
  
  def turn_count
    turn_count = 0
    @board.each do |spot|
      if spot == "X" || spot == "O"
        turn_count += 1
      end
    end
    return turn_count
  end

  def current_player
    if turn_count%2 == 0
      return "X"
    else
      return "O"
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    player = current_player
    if valid_move?(index)
      move(index,player)
      display_board
    else
      turn
    end
  end
  def won?
    WIN_COMBINATIONS.each do |combo|
      win_index1 = combo[0]
      win_index2 = combo[1]
      win_index3 = combo[2]
      position_1 = @board[win_index1]
      position_2 = @board[win_index2]
      position_3 = @board[win_index3]
      if position_1 == "X" and position_2 == "X" and position_3 == "X"
        return combo
      elsif position_1 == "O" and position_2 == "O" and position_3 == "O"
        return combo
      end
    end
    return FALSE
  end
  def full?
    @board.all?{|spot| spot.include?("X") || spot.include?("O")}
  end
  
  def draw?
    !(won?) && full?
  end
  
  def over?
    won? || full? || draw?
  end
  
  def winner
    if won?
      wincombo = won?
      return @board[wincombo[0]]
    else
      return nil
    end
  end
  def play
    current_turn = 1
    while current_turn < 10 && !over? do
      turn
      current_turn += 1
    end
    if won?
        puts "Congratulations #{winner}!"
    elsif draw?
        puts "Cat's Game!"
    end
  end
end
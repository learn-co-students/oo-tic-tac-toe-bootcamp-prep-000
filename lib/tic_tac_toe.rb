class TicTacToe
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]]

  def initialize
    @board = Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts "-----------"
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, player)
    @board[index] = player
  end
  
  def position_taken?(index)
    @board[index] != " " ? true : false
  end
  
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end
  
  def turn_count
    @board.count {|position| position != " "}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    puts "Enter 1-9: "
    input = gets
    input = input_to_index(input)
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end
  
  def won?
    TicTacToe::WIN_COMBINATIONS.each do |i|
      pos_one = @board[i[0]]
      pos_two = @board[i[1]]
      pos_three = @board[i[2]]
      ["X", "O"].each do |player|
        if pos_one == player &&pos_two == player &&pos_three == player
          return i
        end
      end
    end
    false
  end
  
  def full?
    turn_count == 9 ? true : false
  end
  
  def draw?
    if full? && !won?
      true
    elsif won? != false
      false
    else
      false
    end
  end
  
  def over?
    if draw?
      true
    elsif won? != false
      true
    else
      false
    end
  end
  
  def winner
    if over? && !draw?
      @board[won?[0]]
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
    elsif draw?
      puts "Cat's Game!"
    end
    
  end
end
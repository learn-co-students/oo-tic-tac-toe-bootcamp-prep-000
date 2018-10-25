class TicTacToe
  def initialize
    @board = Array.new(9, " ")
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
    user_input = user_input.to_i
    user_input -= 1
  end
  
  def move(index, token)
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] != " "
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end
  
  def turn
    token = current_player
    input = gets.strip
    index = input_to_index(input)
    if !valid_move?(index)
      until valid_move?(index)
        input = gets.strip
        index = input_to_index(input)
      end
    end
    move(index, token)
    display_board
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      if (combo.all? {|position| @board[position] == "X"}) or (combo.all? {|position| @board[position] == "O"})
        return combo
      end
    end
    false
  end
  
  def full?
    @board.none? {|i| i == " "} && !won?
  end
  
  def draw?
    if full? and !won?
      return true
    else
      false
    end
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    winning_line = won?
    if winning_line
      return @board[winning_line[0]]
    end
  end
  
  def play
    until over?
      puts "Enter a number 1-9:"
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
    
end


class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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
  ROW_CONTENTS = []

  
  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(n)
    n.to_i - 1
  end
  
  def move(index, player)
    if valid_move?(index)
      @board[index] = player
    else
      turn
    end
  end
  
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    elsif @board[index] == "X" || @board[index] == "O"
      true
    end
  end
  
  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
        true
      else
        false
    end
  end
  
  def turn
    puts "Please enter 1-9:" 
    input = gets.strip
    index = input_to_index(input)
    player= current_player
    move(index, player)
    display_board
  end
  
  def move(index, player)
    if valid_move?(index)
      @board[index] = player
    else
      turn
    end
  end
  
  def turn_count
    turns_played = 0
    @board.each do |space_content|
      if space_content == "X" || space_content == "O"
        turns_played += 1
      end
    end
    turns_played
  end
  
  def current_player
    if turn_count % 2 == 0 
      "X"
    else
      "O"
    end
  end
  def won? 
    WIN_COMBINATIONS.each do |combination|
      ROW_CONTENTS.clear
        combination.each do |index|
          if position_taken?(index)
            ROW_CONTENTS << @board[index]
          end
          if (ROW_CONTENTS.length == 3 && ROW_CONTENTS[0] == ROW_CONTENTS[1] && ROW_CONTENTS[1] == ROW_CONTENTS[2])
            return combination
          end      
        end
      end
    return false
  end
  
  def full?
    !@board.include?(" ") 
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    full? || won? || draw?
  end
  
  def winner
    if won?
      @board[won?[0]]
    end
  end
  
  def play
    while (!over?) do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end
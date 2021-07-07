class TicTacToe
  
  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
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
  
  def move(index, current_player = "X")
    @board[index] = current_player
  end
  
  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
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
    turns = 0
    @board.each do |space|
      if space == "X" || space == "O"
        turns += 1
      end
    end
    turns
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  # from Tic Tac Toe Game Status
  
  def won?
    result = nil
    WIN_COMBINATIONS.each do |combo|
      pos_1 = @board[combo[0]]
      pos_2 = @board[combo[1]]
      pos_3 = @board[combo[2]]
      if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") || (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
        result = combo
      end
    end
    result
  end
  
  def full?
    @board.all? {|space| space == "X" || space == "O"}
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    won? || draw? || full?
  end
  
  def winner
    if combo = won?
      @board[combo[0]]
    else
      nil
    end
  end
  
  #from Tic Tac Toe Play Loop
  
  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end
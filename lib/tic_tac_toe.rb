class TicTacToe
  def initialize(board=nil)
    @board = board || [" "]*9
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]

  def display_board
    rows = (0..8).step(3).collect{|i| (i..i+2).collect{|j|" #{@board[j]} "}.join("|")}
    div = "\n" +  "-"*11 + "\n"
    puts rows.join(div)
  end

  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, token)
    @board[index] = token
  end
  
  def position_taken?(index)
    ["X", "O"].include?(@board[index])
  end
  
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end
  
  def turn
    valid_go = false
    player_to_move = current_player
    until valid_go do
      puts "Please enter a number between 1 and 9:"
      input = gets.strip
      pos = input_to_index(input)
      if valid_move?(pos)
        valid_go = true
        move(pos, player_to_move)
        display_board
      end
    end
  end
  
  def turn_count
    @board.count{|x| x == "X" || x == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.detect{|l|
      l.collect{|x| @board[x]}.uniq.length == 1 && ["X", "O"].include?(@board[l[0]])}
  end
  
  def full?
    @board.all?{|x| x == "X" || x == "O"}
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    won_game = won?
    if won_game
      @board[won_game[0]]
    end
  end
  
  def play
    until over?
      turn
    end
    player_win = winner
    if player_win
      puts "Congratulations #{player_win}!"
    else
      puts "Cat's Game!"
    end
  end
end
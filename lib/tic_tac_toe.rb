class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #Top horizontal
    [3,4,5], #Middle horizontal
    [6,7,8], #Bottom horizontal
    [0,3,6], #Left vertical
    [1,4,7], #Middle vertical
    [2,5,8], #Right vertical
    [0,4,8], #Left-to-right diagonal
    [2,4,6] #Right-to-left diagonal
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    (input.to_i) - 1
  end

  def move(position, token)
    @board[position] = token
  end

  def position_taken?(position)
    if @board[position] == " " || @board[position] == "" || @board[position] == nil
      false
    else
      true
    end
  end

  def valid_move?(position)
    if !position_taken?(position) && position.between?(0, 8)
      true
    else
      false
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
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

  def won?
    WIN_COMBINATIONS.detect{|win_combo| 
      @board[win_combo[0]] == @board[win_combo[1]] && 
      @board[win_combo[1]] == @board[win_combo[2]] && 
      position_taken?(win_combo[0])
    }
  end

  def full?
    @board.all? {|cell| cell == "X" || cell == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end

    if won?
      if winner == "X"
        puts "Congratulations X!"
      else winner == "O"
        puts "Congratulations O!"
      end
    else draw?
      puts "Cat's Game!"
    end
  end
  
end

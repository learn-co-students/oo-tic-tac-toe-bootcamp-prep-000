class TicTacToe

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],
                      [0,3,6],[1,4,7],[2,5,8],
                      [0,4,8],[6,4,2]]

  def initialize(board = nil)
    @board = board || [" "]*9
  end

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(position)
    @board[position] != " " && @board[position] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn()
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player())
      display_board()
    else
      turn()
    end
  end

  def turn_count()
    counter = 0
    @board.each do |space|
      if space == "X" || space == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player()
    if turn_count() % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?()
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[0]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  def full?()
    @board.none?{|i| i == " "}
  end

  def draw?()
     full?() && !won?()
  end

  def over?()
    draw?() || full?() || won?()
  end

  def winner()
    if won?()
      @board[won?()[0]]
    end
  end

  def play()
    #play until game is a draw, board is full, or player won
    until over?()
      turn()
    end
    #if the player won
    if won?()
      puts "Congratulations #{winner()}!"
    #or if the players had a draw
    elsif draw?()
      puts "Cat's Game!"
    end
  end
end

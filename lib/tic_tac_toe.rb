class TicTacToe
  def initialize(board=nil)
    @board = board || Array.new(9," ")
  end
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def won?
    win = WIN_COMBINATIONS.detect do |combo|
        position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[0]]== @board[combo[2]]
    end
    if win == nil
      win = false
    end
    win
  end

  def full?
    @board.none? do |index|
      index == " " || index == nil
    end
  end

  def draw?
    if full? && won? == false
      true
    end
  end

  def over?
    if won? != false || draw?
      true
    end
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def turn_count
    @board.count { |square| square == "X" || square == "O" }
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

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

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
end

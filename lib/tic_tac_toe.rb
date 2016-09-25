class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end




  def move(input, token = "X")
    @board[input.to_i - 1] = token
  end



  def position_taken?(input)
    !(@board[input] == nil || @board[input] == " ")
  end


  def valid_move?(input)
    !position_taken?(input.to_i - 1) && (input.to_i >= 1 && input.to_i <= 9)
  end


def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def turn
    display_board
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
    else
      while !valid_move?(input)
        display_board
        puts "Please enter 1-9:"
        input = gets.strip
      end
      move(input, current_player)
    end
  end

  def won?
      WIN_COMBINATIONS.detect do |combination|
      @board[combination[0]] == @board[combination[1]] &&
      @board[combination[1]] == @board[combination[2]] &&
      position_taken?(combination[0])
    end
  end

  def full?
    @board.all? do |position|
      position == "X" || position == "O"
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      return @board[won?[0]]
    else
      return nil
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end




end

class TicTacToe

  attr_accessor(:input, :index, :board)

  def initialize(input, index, board = nil)
    @input, @index, = input, index
    #player?
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index() @input.to_i-1 end

  def move() @board[@index] = currentplayer end

  def position_taken?() !(@board[@index].nil? || @board[@index] == " ") end

  def valid_move?() (0..8).include?(@index) && @board[@index] == " " end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def won?()
    WIN_COMBINATIONS.each do |x|
      return x if x.all? { |y| @board[y] == "X" }
      return x if x.all? { |y| @board[y] == "O" }
    end
    false
  end

  def full?() @board.count(" ") == 0 end

  def draw?() !(won?) && full? end

  def over?() won? || full? || draw? end

  def winner() won? == false ? nil : @board[won?[0]] end

  def turn_count() @board.count{|token| token == "X" || token == "O"} end

  def current_player() turn_count % 2 == 0 ? "X" : "O" end

  def turn()

    puts "Please enter 1-9:"
    @input = gets.strip
    @index = input_to_index

    until valid_move?
      puts "That's not a valid number, please enter 1-9:"
      @input = gets.strip
      @index = input_to_index
    end

    move
    display_board

  end

  def play

    turn until over?
    puts won? == false ? "Cats Game!" : "Congratulations #{winner}!"

  end

end

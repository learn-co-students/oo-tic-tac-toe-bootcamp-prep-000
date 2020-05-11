class TicTacToe
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  
  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i-1
  end

  def move(index,player)
    @board[index]=player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    !position_taken?(index) if index.between?(0,8)
  end

  def turn
    loop do
      puts "Please enter 1-9:"
      index=input_to_index(gets.strip)
      if valid_move?(index)
        move(index,current_player)
        display_board
        break
      end
    end
  end

  def turn_count
    @board.count { |token| token=="X" || token=="O" }
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      return combination if combination.all? {|i| @board[i]=="X"}
      return combination if combination.all? {|i| @board[i]=="O"}
    end
    false
  end

  def full?
    @board.none? {|c| c==" "}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    won=won?
    return @board[won[0]] if won
  end

  def play
    turn until over?
    puts won? ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end

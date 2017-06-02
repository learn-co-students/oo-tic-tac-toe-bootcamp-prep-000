class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8], #horizonatal wins
    [0,3,6],[1,4,7],[2,5,8], #verticle wins
    [0,4,8],[2,4,6]
  ]

  def initialize(board=nil)
    @board = board || Array.new(9," ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def turn
    index = 0
    loop do
      puts "Please enter 1-9:"
      your_move = gets.strip
      index = input_to_index(your_move)
      break if valid_move?(index)
    end
    move(index,current_player)
    display_board
  end

  def input_to_index(your_move)
    your_move = your_move.to_i - 1
    your_move
  end

  def move(index,player)
    @board[index]=player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def play
    while (!over?)
      turn
    end
    puts won? ?  "Congratulations #{winner}!" : "Cat's Game!"
  end

  def won?
        win = WIN_COMBINATIONS.chunk { |n| n.all?{|x| @board[x] == "X"} || n.all?{|x| @board[x] == "O"}}.detect{|win,ary|  win}
        win ? win[1][0] : nil
  end

  def draw?
    (full? && !won?)
  end

  def over?
    (draw? || won?)
  end

  def winner
    # won?
    win = won?
    win ? @board[win[0]] : nil
  end

  def full?
    @board.all?{|b| b != " "}
  end

  def turn_count
    @board.count{|token| token != " "}
  end

  def current_player
    (turn_count) %2 == 0 ? "X" : "O"
  end

end

class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #left column
    [1, 4, 7], #middle column
    [2, 5, 8], #right column
    [0, 4, 8], #left to right diagonal
    [6, 4, 2] #right to left diagonal
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

  def move(index, token="X")
    @board[index] = token
  end

  def position_taken?(index)
    want = @board[index]
      if (want == " " || want == "" || want == nil)
       false
     else
       true
     end
   end

   def valid_move?(index)
       index.between?(0, 8) && !position_taken?(index)
   end

   def turn
     puts "Please enter 1-9:"
     user_input = gets.strip
     index = input_to_index(user_input)
        if valid_move?(index)
         move(index, current_player)
         display_board
       else turn
     end
   end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  def full?
    if @board.reject{ |i| i == " "}.length == 9
     return true
   end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if draw? == true
      nil
    elsif over? && won?
      @board[won?[0]]
   else nil
    end
  end

  def play
    while !over?
         turn
       end

      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
  end
end

end

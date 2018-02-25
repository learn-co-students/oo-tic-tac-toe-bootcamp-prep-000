class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ") #question: why is it an or here?
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

  #ttt-4: Display what the current board looks like with all pieces placed
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  #ttt-5: takes in the value of user and converts it to the correct # for the board position
  def input_to_index(move)
    move.to_i - 1
  end


  def move(index, player)
    @board[index] = player
  end

  #ttt-6
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  #ttt-7
  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  #ttt-8
  def turn
     puts "Please enter 1-9:"
     input = gets.strip
     num = input_to_index(input)
     if valid_move?(num) == false
       turn
     else
       move(num, current_player)
     end
     display_board
  end

  #ttt-10
  def turn_count
    counter = 0
    @board.each do |move|
      move == "X" || move == "O" ? counter += 1 : counter += 0
    end
    return counter
  end


  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  #ttt-11
  def won?
    WIN_COMBINATIONS.detect do |i|
      @board[i[0]] == @board[i[1]] &&
      @board[i[0]] == @board[i[2]] &&
      position_taken?(i[0])
    end
  end


  def full?
    @board.all? do |i|
      i == "X" || i == "O"
    end
  end


  def draw?
    !won? && full?
  end


  def over?
    won? || draw?
  end


  def winner
    i = won?
    if won?
      @board[i[0]]
    end
  end


  def play
    while !over?
      turn
    end
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end

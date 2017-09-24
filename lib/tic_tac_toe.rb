class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  WIN_COMBINATIONS = [   # An array for each win combination
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6], # 1st Column
    [1,4,7], # 2nd Column
    [2,5,8], # 3rd Column
    [0,4,8], # 1st Diagnal
    [2,4,6] # 2nd Diagnal
  ]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(input)
    index = input.to_i - 1
  end
  def move(index, character)
    @board[index] = character
  end
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
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
      character = current_player
      move(index, character)
    else
      turn
    end
    display_board
  end
  def won?
  WIN_COMBINATIONS.any? do |sequence|
    if position_taken?(sequence[0]) &&
      @board[sequence[0]] == @board[sequence[1]] &&
      @board[sequence[1]] == @board[sequence[2]]
      return sequence
      end
    end
  end
  def full?
    @board.all? {|character| character == "X" || character == "O" }
  end
  def draw?
      full? && !won? #DRAW CONDITION
  end
  def over?
    if draw?
      return true
    elsif won?
      return true
    end
  end
  def winner
    if x = won?
      @board[x.first]
    end
  end
  def play
    while !over?
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end
end

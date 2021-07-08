class TicTacToe
  attr_reader :board
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6] # ETC, an array for each win combination
  ]
  def display_board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(num)
    @num = num.to_i - 1
  end
  def move(index, value= "X")
    @board[index] = value
  end
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  def turn_count
    count = 0
    @board.each do |space|
    if space == "X" || space == "O"
       count += 1
      end
    end
    count
  end
  def current_player
    (turn_count % 2 == 0 )?
    "X" : "O"
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
    WIN_COMBINATIONS.any? do |i|
      #  binding.pry
      if  board[i[0]] == board[i[1]] && board[i[1]] == board[i[2]] && position_taken?( i[0])
        # binding.pry
      return  i
      end
    end
  end

  def full?
    board.all? do |i|
       i == "X" || i == "O"
    end
  end

  def draw?
   full? && !won?
  end

  def over?
    draw? || won?
  end
  def winner
    winner_arr = won?
    if winner_arr
      winner_index = winner_arr[0]
      board[winner_index]
    end
  end

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end





end

class TicTacToe

  def initialize()
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
                      [0,1,2],
                      [3,4,5],
                      [6,7,8],
                      [0,3,6],
                      [1,4,7],
                      [2,5,8],
                      [2,4,6],
                      [0,4,8]
                     ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    @index = input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == " " ? false : true
  end

  def valid_move?(index)
    @board[index] == " " && index.between?(0,8) ? true : false
  end

  def turn_count
    count_check = @board.select { |position| position != " " }
    count_check.length
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else turn
    end
  end

  def won?
    over? && !draw?
  end

  def full?
    @board.all? { |position| position != " " }
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

end

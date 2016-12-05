class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def board= board
    @board = board
  end

  def board
    @board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def is_number? string
    true if Integer(string) rescue false
  end

  def input_to_index input
    if input.is_a? Integer
      return input
    end

    retval = 0

    if is_number? input
      retval = input.to_i - 1
    else
      retval = -1
    end
  end

  def move(pos, chr)
    @board[(pos.to_i - 1)] = chr
  end

  def position_taken? (index)
    reval = nil

    if (@board[index] == " ") || (@board[index] == "") || (@board[index] == nil)
      retval = false
    elsif (@board[index] == "X") || (@board[index] == "O")
      retval = true
    end
    retval
  end

  def valid_move? (index)
    index = input_to_index(index)
    index > -1 && index < 8 && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    is_valid_move = false
    while is_valid_move == false do
      input = gets.strip
      index = input_to_index(input)
      is_valid_move = valid_move?(index)
    end
    piece = @board.count{ |x| x == " "} % 2 == 0 ? "O" : "X"
    move(index, piece)
    display_board
  end

  def turn_count
    count = 0
    @board.each do |e|
      if e != " "
        count += 1
      end
    end
    return count
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    flag = false
    WIN_COMBINATIONS.map do |x|
      xs = []
      x.each { |y| xs.push(@board[y]) }
      flag = !xs.empty? && xs.all? { |x| x == "X" }
      flag = !xs.empty? && xs.all? { |x| x == "O" } if flag == false
      flag = x if flag
      break if flag
    end
    flag
  end

  def full?
    @board.all? { |x| x == "X" || x =="O" }
  end

  def draw?
    full = full?
    won = won?
    full && !won
  end

  def over?
    draw? || won?
  end

  def winner
    x = won?
    x.kind_of?(Array) ? @board[x[0]] : nil
  end

  def play
    while !over? do
      turn
    end

    if won? != nil
      puts "Congratulations #{winner}!"
    end

    if draw?
      puts "Cats Game!"
    end
  end

end

class TicTacToe
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


  def initialize(board = nil)
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
    @input = input
    @input.to_i - 1
  end

  def move(input, char)
    @board[input] = char
  end

  def position_taken?(position)
    (@board[position] == "X" || @board[position] == "O") ?
    true : false
  end

  def valid_move?(index)
    (index.between?(0,8) && !position_taken?(index)) ?
    true : false
  end

  def turn_count
    count = 0
    @board.each do |space|
      if space == "X" || space == "O"
        count += 1
      end
    end
    return count
  end

  def current_player
    turn_count % 2 == 0 ?
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
      WIN_COMBINATIONS.each do |win|
       if (@board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] == "X") ||
          (@board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] == "O")
         return win
       end
     end
     return false
  end

  def full?
     @board.all? do |position|
       position == "X" || position == "O" ?
       true : false
     end
  end

  def draw?
     !(won? || !full?)
  end

  def over?
     (won? || draw?)
  end

  def winner
     if won?
       return @board[won?[0]]
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

class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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

  def move(index, player="X")
    @board[index] = player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "INVALID MOVE! index #{index} is already filled by #{@board[index]}. Try again."
      turn
    end
  end

  def turn_count
    @board.count {|spot| (spot.include? "X") || (spot.include? "O")}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |win|
      #does any win in board have all x's or all o's?
      occupants = [@board[win[0]], @board[win[1]], @board[win[2]]]
      if occupants.all? {|p| p == "X"} || occupants.all? {|p| p == "O"}
        return win
      end
    end
    return nil
  end

  def full?
    return @board.all? {|p| p == "X" || p == "O"}
  end

  def draw?
    #board full and not won means draw
    return full? && !won?
  end

  def over?
    return won? || full?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    until over? || draw?  #draw check is redundant, Learn's test is dumb
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?  #this can just be else, but tests from Learn are dumb
      puts "Cat's Game!"
    end
  end

end

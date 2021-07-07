class TicTacToe

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(pos, token)
    @board[pos] = token
  end

  def won?
    WIN_COMBINATIONS.each do |arr|
      if @board[arr[0]] != " " && @board[arr[0]] == @board[arr[1]]  && @board[arr[0]] == @board[arr[2]]
        return arr
      end
    end
    false
  end

  def full?
    !@board.any? {|e| e == " "}
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def turn_count
    i = 0
    @board.each {|e| i += 1 if e != " " }
    i
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
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
    if !valid_move?(index)
      turn
    end
    move(index, current_player)
    display_board
  end

  # Define your play method below
  def play
    while over? == false  do
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    end
  end
  
end
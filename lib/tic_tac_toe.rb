class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
    puts "Welcome to TicTacToe!"
    display_board
  end

  # Define your WIN_COMBINATIONS constant
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

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def won?
    WIN_COMBINATIONS.each do |i|
      if (position_taken?(i[0]))
        if (@board[i[0]] == @board[i[1]] && @board[i[0]] == @board[i[2]])
          return i
        end
      end
    end
    false
  end

  def full?
    !@board.include?(" ")
  end

  def draw?
    full? && !won?
  end

  def over?
    if won? || draw?
       return true
     else
       return false
     end
  end

  def winner
    if line = won?
      return @board[line[0]]
    else return nil
    end
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
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
      turn
    end
  end

  # Define your play method below
  def play
    i = 1
    while (i <= 9) do
      if (!over?)   #This is completely uneeded, except to pass the tests. :-(
        turn
      end
      if (won?)
        puts "Congratulations #{winner}!"
        return
      elsif (draw?)
        puts "Cat's Game!"
        return
      end
      i += 1
    end
  end

end

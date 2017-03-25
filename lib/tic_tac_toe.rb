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

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
    puts "Welcome to Tic Tac Toe!"
  end

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

  def move(index,current_player="X")
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " " || @board[index] == "")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
    else
      puts "Hey, pay attention!"
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.find do |win_combo|
      # win index, calm down.
      windex_1 = win_combo[0]
      windex_2 = win_combo[1]
      windex_3 = win_combo[2]
      # setup position placeholder to compare arrays
      position_1 = @board[windex_1]
      position_2 = @board[windex_2]
      position_3 = @board[windex_3]
      # check positions for all "X" or all "O"
      if ((position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O"))
        return win_combo
      end
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def full?
    @board.all?{|symbol| symbol == "X" || symbol == "O"} ? true : false
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end

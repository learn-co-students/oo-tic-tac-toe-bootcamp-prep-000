class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
  ]

  def initialize(board=nil)
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} " + "|" + " #{@board[1]} " + "|" + " #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} " + "|" + " #{@board[4]} " + "|" + " #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} " + "|" + " #{@board[7]} " + "|" + " #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(input, current_player="X")
    index = input_to_index(input)
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(input)
    index = input_to_index(input)
    index.between?(0,8) && !position_taken?(index)
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def turn_count
    turns = 0
    @board.each do |character|
      if character == "X" || character == "O"
        turns += 1
      end
    end
    turns
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    win_combination = false
    WIN_COMBINATIONS.each do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]
      if (@board[win_index_1] == "X" && @board[win_index_2] == "X" && @board[win_index_3] == "X") || (@board[win_index_1] == "O" && @board[win_index_2] == "O" && @board[win_index_3] == "O")
        win_combination = win_combo
      end
    end
    win_combination
  end

  def full?
    if @board.none? {|position| position == " "}
      true
    else
      false
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      return @board[won?[0]]
    else
      nil
    end
  end

  def play
    until over?
      display_board
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end
end

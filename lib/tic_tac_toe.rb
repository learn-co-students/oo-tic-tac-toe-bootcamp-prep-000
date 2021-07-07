class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
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

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] != " "
      true
    else
      false
    end
  end

  def valid_move?(index)
    if !position_taken?(index) && @board[index] == " " && index.between?(0,8)
      true
    else
      false
    end
  end

  def turn_count
    counter = 0
    @board.each do |turn|
      if turn != " "
        counter += 1
      else
        counter += 0
      end
    end
      counter
  end

  def current_player
    if turn_count%2 == 0
      "X"
    else
      "O"
    end
end

  def turn
    puts "Please enter 1-9"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      win_index_1 = combo[0]
      win_index_2 = combo[1]
      win_index_3 = combo[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
    end
  end

  def full?
    if @board.detect{|index| index == "" || index == " "}
      false
    else
      true
    end
  end

  def draw?
    if !won? && full?
      true
    else
      false
    end
  end

  def over?
    if won? || full? || draw?
      true
    else
      false
    end
  end

  def winner
    if won?
      @board[won?[0]]
    else
    end
  end

  def play
    until over? == true
      turn
    end
    if won?
      puts "Congratulations " + winner + "!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end

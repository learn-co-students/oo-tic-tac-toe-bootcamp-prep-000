class TicTacToe

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

  def input_to_index(user_input)
    return user_input.to_i - 1
  end

  def move(index, character)
    if valid_move?(index)
      @board[index] = character
      return true
    end
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    if !(index.between?(0, 8)) || position_taken?(index)
      return false
    else
      return true
    end
  end

  def turn
    puts "Please enter 1-9:"
    index = input_to_index(gets.strip)
    if move(index, current_player)
      display_board
    else
      turn
    end
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn_count
    counter = 0
    @board.each do |pos|
      if pos == "X" || pos == "O"
        counter += 1
      end
    end
    return counter
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|

      position = [
        @board[win_combination[0]],
        @board[win_combination[1]],
        @board[win_combination[2]]
      ]

      if position.select{|i| i == "X"}.length == 3 || position.select{|i| i == "O"}.length == 3
        return win_combination
      end

    end

    return false
  end

  def full?
    @board.select{|i| i == "X"}.length + @board.select{|i| i == "O"}.length == 9
  end

  def draw?
    !(won?) && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      return @board[won?[0]]
    else
      return nil
    end
  end

  def play
    display_board
    until over? do
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end

  end

end

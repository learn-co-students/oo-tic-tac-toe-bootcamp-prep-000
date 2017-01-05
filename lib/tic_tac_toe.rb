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
    puts " #{@board[0]} " + "|" + " #{@board[1]} " + "|" + " #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} " + "|" + " #{@board[4]} " + "|" + " #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} " + "|" + " #{@board[7]} " + "|" + " #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(position, character)
    @board[position] = character
  end

  def position_taken?(index)
     !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(position)
    position = position.to_i
    position.between?(0, 8) && !position_taken?(position)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    input = input_to_index(input)
    if !valid_move?(input)
      turn
    end
    character = current_player
    move(input, character)
    display_board
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    player = turn_count
    player % 2 == 0 ? "X" : "O"
  end

  def won?
    ["X", "O"].each do |symbol|
      WIN_COMBINATIONS.each do |win_combination|
        all_equal = win_combination.all? do |position|
          @board[position] == symbol
        end
        if all_equal
          return win_combination
        end
      end
    end
    return false
  end

  def full?
    @board.each_with_index do |position, index|
      if !position_taken?(index)
        return false
      end
    end
  end

  def draw?
    if won?
      return false
    elsif full?
      return true
    end
  end

  def over?
    if draw? || won?
      return true
    end
    return false
  end

  def winner
    return won? ? @board[won?[0]] : nil
  end

  def play
    while !over?
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else
      puts "Cats Game!"
    end
  end



end

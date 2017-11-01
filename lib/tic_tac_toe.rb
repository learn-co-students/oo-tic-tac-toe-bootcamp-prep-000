class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4, 5], # Middle row
    [6, 7, 8], # Bottom row
    [0, 3, 6], # Left column
    [1, 4, 7], # Middle column
    [2, 5, 8], # Right column
    [0, 4, 8], # Diagonal \
    [2, 4, 6], # Diagonal /
  ]

  def initialize
    @board = Array.new(9, " ")
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

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != "" && @board[index] != nil
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
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

  def turn_count
    turns_played = 0
    @board.each { |position|
      if position == "X" || position == "O"
        turns_played += 1
      end
    }
    turns_played
  end

  def current_player
    (turn_count % 2 == 0) ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index1 = win_combination[0]
      win_index2 = win_combination[1]
      win_index3 = win_combination[2]
      pos_1 = @board[win_index1]
      pos_2 = @board[win_index2]
      pos_3 = @board[win_index3]
      if pos_1 == pos_2 && pos_2 == pos_3 && position_taken?(win_index1)
        return win_combination
      end
    end
    false
  end

  def full?
    @board.all? { |position| position != nil && position != " " }
  end

  def draw?
    full? && !won? ? true : false
  end

  def over?
    full? || won? || draw? ? true : false
  end

  def winner
    if win_combination = won?
      @board[win_combination[0]]
    end
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

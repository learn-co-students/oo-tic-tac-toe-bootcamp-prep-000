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

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, player_character = "X")
    @board[index] = player_character
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
      !position_taken?(index) && (index >= 0 && index <= 9)
  end

  def turn_count
    count = 0
    @board.each do |position|
      if position == "X" || position == "O"
        count += 1
      end
    end
    return count
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    character = current_player
    if valid_move?(index)
      move(index, character)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      position_1 = win_combination[0]
      position_2 = win_combination[1]
      position_3 = win_combination[2]
      if @board[position_1] == "X" && @board[position_2] == "X" && @board[position_3] == "X"
        return win_combination
      elsif @board[position_1] == "O" && @board[position_2] == "O" && @board[position_3] == "O"
        return win_combination
      end
    end

    empty_board = @board.any? { |position| position == "X" || position == "O" }
    if empty_board
      return false
    end
  end

  def full?
    @board.all?{ |position| position == "X" || position == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    winning_combo = won?
    if won?
      return @board[winning_combo[0]]
    else
      nil
    end
  end

  def play
    until over?
      turn
    end

    if won?
      game_winner = winner
      puts "Congratulations #{game_winner}!"
    else
      puts "Cat's Game!"
    end
  end

end

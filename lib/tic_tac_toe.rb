class TicTacToe

  def initialize
    @board = Array.new(9, " ")
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

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(location)
    !position_taken?(location) && location.between?(0, 8)
  end

  def move(index, player_character)
    @board[index] = player_character
  end

  def turn
    display_board
    puts "Please enter 1-9"
    user_input = gets.strip
    location = input_to_index(user_input)
    if valid_move?(location)
      player_character = current_player
      move(location, player_character)
    else
      turn
    end
  end

  def turn_count
    @board.count{|character| character == "X" || character == "O"}
  end

  def current_player
    character = ""
    if turn_count.even?
      character = "X"
    elsif turn_count.odd?
      character = "O"
    end
  end

  def won?
    winner = ""
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
        winner = false
      end
    end
    winner
  end

  def full?
    @board.all? do |character|
      character == "X" || character == "O"
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    winning_player = nil
    if won?
      winning_positions = won?
      winning_positions.all? do |index|
        if @board[index] == "X"
          winning_player = "X"
        elsif @board[index] == "O"
          winning_player = "O"
        end
      end
    end
    winning_player
  end

  def play
    until over? do
      turn
    end
    if won?
      display_board
      puts "Congratulations #{winner}!"
    elsif draw?
      display_board
      puts "Cat's Game!"
    end
  end
end

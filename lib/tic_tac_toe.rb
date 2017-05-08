class TicTacToe
  def initialize(board = [" "," "," "," "," "," "," "," "," "])
    @board = board
  end
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
  def move(index, letter)
    @board[index] = letter
  end
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  def turn
    puts "Please enter 1-9:"
    @input = gets.strip
    @index = input_to_index(@input)
    if valid_move?(@index)
      move(@index, current_player)
      display_board
    else
      turn
    end
  end
  def turn_count
    counter = 0
    @board.each do |count|
      if count == "X" || count == "O"
        counter += 1
      end
    end
    return counter
  end
  def current_player
    z = turn_count
    if z % 2 == 0
      return "X"
    else
      return "O"
    end
  end
  def won?
      WIN_COMBINATIONS.each do |win_combo|
        number_f = win_combo[0]
        number_s = win_combo[1]
        number_t = win_combo[2]
        if @board[number_f] == "X" && @board[number_s] == "X" && @board[number_t] == "X"
          return [number_f, number_s, number_t]
        elsif @board[number_f] == "O" && @board[number_s] == "O" && @board[number_t] == "O"
          return [number_f, number_s, number_t]
        end
      end
    return false
  end
  def full?
    @board.each do |square|
      if square == " " || square == "" || square == nil
        return false
      end
    end
    return true
  end
  def draw?
    if won?
      false
    elsif full?
      true
    end
  end
  def over?
    if draw?
      true
    elsif won?
      true
    else
      false
    end
  end
  def winner
    if won? == false
      nil
    else
      win_array = won?
      find_letter = win_array[0]
      return @board[find_letter]
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

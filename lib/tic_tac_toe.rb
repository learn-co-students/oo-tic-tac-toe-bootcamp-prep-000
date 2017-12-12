class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

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
    if index.between?(0, 8) && !position_taken?(index)
      true
    else
      false
    end
  end

  def turn_count
    @board.count{|token| token != " "}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |winning_combo|
      win_index = winning_combo
        (@board[win_index[0]] == "X" && @board[win_index[1]] == "X" && @board[win_index[2]] == "X") ||
        (@board[win_index[0]] == "O" && @board[win_index[1]] == "O" && @board[win_index[2]] == "O")
      end
  end

  def full?
    if @board.detect{|token| token == " "}
      false
    else
      true
    end
  end

  def draw?
    if full? && won?
      false
    elsif !full?
      false
    else
      true
    end
  end

  def over?
    if draw? || won?
      true
    else
      false
    end
  end

  def winner
    if won?
      winning_combo = won?
      return @board[winning_combo[0]]
    else
      return nil
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

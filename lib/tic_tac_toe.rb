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

  def move(index, current_player = "X")
    index -= 1
    @board[index] = current_player
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index = index.to_i - 1
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Enter a number from 1-9:"
    index = gets.strip.to_i
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def won?
    WIN_COMBINATIONS.detect{|win| @board[win[0]] == @board[win[1]] && @board[win[1]] == @board[win[2]] && position_taken?(win[0])}
  end

  def full?
    @board.each do |turn|
      if turn == " "
        return false
      end
    end
  end


  def draw?
    if full? && !won?
      true
    else
      false
    end
  end

  def over?
    draw? || won? || full?
  end


  def winner
    if draw? || !won?
      return nil
    elsif @board[won?[0]] == "X"
      return "X"
    elsif @board[won?[0]] == "O"
      return "O"
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end

class TicTacToe
  def initialize(board = Array.new(9, " "))
    @board = board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end



  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def won?
    final = []
    WIN_COMBINATIONS.each do |row|
      if @board[row[0]] == "X" && @board[row[1]] == "X" && @board[row[2]] == "X"
        final << row
      elsif @board[row[0]] == "O" && @board[row[1]] == "O" && @board[row[2]] == "O"
        final << row
      end
    end

    if final.empty?
      return false
    else
      return final[0]
    end

  end

  def valid_move?(index)
    if index < 0 || index > 9
      return false
    elsif position_taken?(index) == true
        return false
    elsif position_taken?(index) == false
        return true
    end
  end

  def full?
    return true if @board.none?{|el| el == " "} && !won?
  end

  def draw?
    if full?
      return true
    else
      return false
    end
  end

  def over?
    return true if draw?
    return true if full?
    return true if won?
    return false
  end

  def winner
    winning_row = won?
    return nil if winning_row == false
    return "O" if @board[winning_row[0]] == "O"
    return "X" if @board[winning_row[0]] == "X"
  end

  def input_to_index(guess)
    guess_int = guess.to_i
    if guess_int > 0
      guess_int = guess_int - 1
    else
      guess_int = -1
    end

    return guess_int
  end

  def move(position, mark)
    @board[position] = mark
  end

  def turn
  puts "Please enter 1-9:"
  move = gets.strip
  num_move = input_to_index(move)
    if valid_move?(num_move)
      move(num_move, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|el| el == "X" || el == "O"}
  end

  def current_player
    if turn_count.even?
      return "X"
    elsif turn_count.odd?
      return "O"
    end
  end

  def play
      until over?
       turn
      end

      if draw?
        puts "Cat's Game!"
      else
        who_won = winner
        puts "Congratulations #{who_won}!"
      end

  end


end

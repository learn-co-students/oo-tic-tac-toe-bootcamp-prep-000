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
    [2, 4, 6],
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index, player)
      @board[index] = player
  end

  def position_taken?(index)
    if @board[index] == "X" or @board[index] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(index)
    if index >= 0 && index <= 8 && !position_taken?(index)
        return true
    else
      return false
    end
  end

  def turn_count
    count = @board.select{|space| space == "X" || space == "O"}
    return count.length
  end

  def current_player
    if turn_count % 2 == 0
      player = "X"
    elsif turn_count % 2 != 0
      player = "O"
    end
  end

  def turn
    input = gets.strip
    index = input_to_index(input)
    player = current_player
    if valid_move?(index)
      move(index, player)
      display_board
    else
      turn
    end
  end

  def won?
    no_win = nil
    if @board.all?{|space| space == " "}
      return false
    else
      WIN_COMBINATIONS.each do |win|
        if win.all?{|space| @board[space] == "X"}
          no_win = false
          return win
        elsif win.all?{|space| @board[space] == "O"}
          no_win = false
          return win
        else
          no_win = true
        end
      end
    end
    if no_win == true
      return false
    end
  end

  def full?
   turn_count == 9
  end

  def draw?
    if full? && !won?
      return true
    end
  end

  def over?
    if won? || draw?
      return true
    end
  end

  def winner
    if won?
      winner = @board[won?[0]]
    end
    winner
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

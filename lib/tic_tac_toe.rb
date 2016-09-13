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

  def move(location, token = "X")
    @location = location.to_i - 1
    @board[@location] = token
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(location)
    @location = location.to_i - 1
    @location.between?(0,8) && !position_taken?(@location)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    return (turn_count.even?) ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.find do |win_combo|
      pos1 = @board[win_combo[0]]
      pos2 = @board[win_combo[1]]
      pos3 = @board[win_combo[2]]
      if (pos1 == "X" && pos2 == "X" && pos3 == "X") || (pos1 == "O" && pos2 == "O" && pos3 == "O")
        win_combo
      end
    end
  end

  def full?
    @board.all? do |e|
      e == "X" || e == "O"
    end
  end

  def draw?
    !won? ? (full? ? true : false) : nil
  end

  def over?
    won? || draw? || full?
  end

  def winner
    !won? ? nil : (won?.all? {
      |i| @board[i] == "X" || @board[i] == "O"
      return @board[i]
      })
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

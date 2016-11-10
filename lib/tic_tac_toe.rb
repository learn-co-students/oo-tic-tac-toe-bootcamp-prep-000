class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  def board
    @board
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

  def move(position, token = "X")
    position = position.to_i
    position -= 1
    token = current_player
    @board[position] = token
  end

  def position_taken?(position)
    position = position.to_i
    @board[position] != " " ? true : false
  end

  def valid_move?(position)
    position = position.to_i
    position -= 1
    position.between?(0, 8) && @board[position] == " " ? true : false
  end

  def turn
    puts "Enter Move 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input)
      display_board
    else
      while !valid_move?(input)
        puts "Invalid move - Try again (1-9):"
        input = gets.strip
      end
      move(input)
      display_board
    end
  end

  def turn_count
    counter = 0
    @board.each do |x|
      counter += 1 if x == "X" or x == "O"
    end
    return counter
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      w1 = win_combination[0]
      w2 = win_combination[1]
      w3 = win_combination[2]

      p1 = @board[w1]
      p2 = @board[w2]
      p3 = @board[w3]

      if p1 == "O" && p2 == "O" && p3 == "O"
        return win_combination
      elsif p1 == "X" && p2 == "X" && p3 == "X"
        return win_combination
      end
    end
    return false
  end

    def full?
      @board.all? {|space| space == "X" or space == "O"}
    end

    def draw?
      full? && !won?
    end

    def over?
      won? || full? || draw?
    end

    def winner
      if won?
        x = won?
        @board[x.first]
      end
    end

    def play
    until over?
      turn
    end
    puts "Cats Game!" if draw?
    puts "Congratulations #{winner}!" if won?
    # end
    end
end

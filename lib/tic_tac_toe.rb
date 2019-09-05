class TicTacToe
  def initialize
    @board = [" "] * 9
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

  def move(index, current_player="X")
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !self.position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = self.input_to_index(input)
    if self.valid_move?(index)
      self.move(index, self.current_player)
      self.display_board()
    else
      self.turn
    end
  end

  def turn_count
    (@board.collect { |x| x == " " ? 0 : 1 }).inject(:+)
  end

  def current_player
    self.turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      combo.all? { |i| @board[i] == "X" } || combo.all? { |i| @board[i] == "O" }
    end
  end

  def full?
    @board.all? { |x| !(x.nil? || x == " ") }
  end

  def draw?
    self.full? && !self.won?
  end

  def over?
    self.draw? || self.won?
  end

  def winner
    winning = self.won?
    if winning
      @board[winning[0]]
    end
  end

  def play
    until self.over?
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    else
      puts "Cat's Game!"
    end
  end
end

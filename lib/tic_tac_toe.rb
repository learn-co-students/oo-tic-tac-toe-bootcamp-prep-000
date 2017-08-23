class TicTacToe
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

  def initialize
    @board = Array.new(9) { ' ' }
  end

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

  def move(index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !self.position_taken?(index)
  end

  def turn_count
    @board.count { |el| el != ' ' }
  end

  def current_player
    self.turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = self.input_to_index(input)
    if self.valid_move?(index)
      self.move(index, current_player)
      self.display_board
    else
      self.turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      return combo if combo.all? { |i| @board[i] == 'X' }
      return combo if combo.all? { |i| @board[i] == 'O' }
    end
    return false
  end

  def full?
    @board.none? { |el| el == ' ' }
  end

  def draw?
    self.full? && !self.won?
  end

  def over?
    self.won? || self.draw?
  end

  def winner
    if combo = self.won?
      @board[combo[0]]
    end
  end

  def play
    until self.over?
      turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    else
      puts "Cat's Game!"
    end
  end
end

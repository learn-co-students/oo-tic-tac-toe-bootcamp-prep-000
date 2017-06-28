require 'pry'

class TicTacToe
  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [6, 4, 2],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(string)
    string.to_i - 1
  end

  def move(position, player)
    @board[position] = player
  end

  def position_taken?(index)
    !!/(X|O)/.match(@board[index])
  end

  def valid_move?(index)
     index.between?(0, @board.length - 1) && !self.position_taken?(index)
  end

  def turn_count
    @board.select{|position| /(X|O)/.match(position)}.length
  end

  def current_player
    self.turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    index = self.input_to_index(gets.chomp)
    if self.valid_move?(index)
      move(index, self.current_player)
      self.display_board
    else
      self.turn
    end
  end

  def won?
    WIN_COMBINATIONS.find{|positions|
      /(X|O)/.match(@board[positions[0]]) &&
      @board[positions[0]] == @board[positions[1]] &&
      @board[positions[0]] == @board[positions[2]]
    }
  end

  def full?
    self.turn_count >= @board.length - 1
  end

  def draw?
    self.full? && !self.won?
  end

  def over?
    self.won? || self.draw?
  end

  def winner
    if winner = self.won?
      @board[winner[0]]
    end
  end

  def play
    while !self.over?
      self.turn
    end
    if self.won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end

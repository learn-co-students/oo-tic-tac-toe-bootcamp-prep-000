
class TicTacToe

attr_accessor :board

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
    @board = [" ", " ", " ",
              " ", " ", " ",
              " ", " ", " "]
    @turn_count = 0
  end

  def display_board
    puts " #{self.board[0]} | #{self.board[1]} | #{self.board[2]} "
    puts "-----------"
    puts " #{self.board[3]} | #{self.board[4]} | #{self.board[5]} "
    puts "-----------"
    puts " #{self.board[6]} | #{self.board[7]} | #{self.board[8]} "
  end

  def input_to_index(user_input)
    index = user_input.to_i - 1
    index
  end

  def move(index, token="X")
    self.board[index] = token
  end

  def position_taken?(index)
    if self.board[index] == "O"
      true
    elsif self.board[index] == "X"
      true
    else
      false
    end
  end

  def valid_move?(index)
    if index.between?(0, 8) && !position_taken?(index)
      true
    end
  end


  def turn_count
    turn_count = 0
    self.board.each do |position|
      if position == "X"
        turn_count += 1
      elsif position == "O"
        turn_count += 1
      end
    end
    turn_count
  end

  def current_player
    if self.turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end


  def turn
    input = gets.chomp.to_i
    index = self.input_to_index(input)

    if self.valid_move?(index)
      self.move(index, self.current_player)
      self.display_board
    else
      self.turn
    end
  end


  def won?
    WIN_COMBINATIONS.detect do |combo|
      self.board[combo[0]] == self.board[combo[1]] &&
      self.board[combo[1]] == self.board[combo[2]] &&
      self.position_taken?(combo[0])
    end
  end

  def full?
    true if self.turn_count == 9
  end

  def draw?
      true if self.full? && self.won? == nil
  end

  def over?
    true if self.won? ||self.draw?
  end

  def winner
    if self.won? != nil
      winning_combo = self.won?
      self.board[winning_combo[0]]
    end
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end





end

module GameRules
  attr_reader :board

  WIN_COMBINATIONS = [
      [0, 1, 2], # top row
      [3, 4, 5], # middle row
      [6, 7, 8], # bottom row
      [0, 3, 6], # left column
      [1, 4, 7], # middle column
      [2, 5, 8], # right column
      [0, 4, 8], # top left to bottom right diagonal
      [6, 4, 2] # bottom left to top right diagonal
  ].freeze

  def move(position, token)
    index = position.to_i - 1
    @board.status[index] = token
  end

  def position_taken?(index)
    !(@board.status[index].nil? || @board.status[index] == ' ')
  end

  def valid_move?(position)
    index = position.to_i - 1
    index.between?(0, 8) && !position_taken?(index)
  end

  def status(player1, player2)
    @board.status.each_with_index do |cell, index|
      if cell == player1.token
        player1.token_set.push(index)
      elsif cell == player2.token
        player2.token_set.push(index)
      end
    end
  end

  def turn_count
    occupied_cells = @board.status.select { |cell| cell == 'X' || cell == 'O' }
    occupied_cells.length
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if  win_combination.all? { |index| @board.status[index] == 'X' } ||
          win_combination.all? { |index| @board.status[index] == 'O' }
        return win_combination
      end
    end
    false
  end

  def full?
    @board.status.all? { |i| i != ' ' }
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end
end

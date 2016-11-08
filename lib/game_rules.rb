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
  ]

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

  def status
    @x_cells = []
    @o_cells = []
    @board.status.each_with_index do |cell, index|
      if cell == 'X'
        @x_cells.push(index)
      end
      if cell == 'O'
        @o_cells.push(index)
      end
    end
  end

  def turn_count
    occupied_cells = @board.status.select { |cell| cell == 'X' || cell == 'O' }
    occupied_cells.length
  end

  def won?
    if WIN_COMBINATIONS.any? do |win_combination|
      win_combination.all? { |index| @board.status[index] == 'X' } ||
          win_combination.all? { |index| @board.status[index] == 'O' }
    end
      WIN_COMBINATIONS.each do |win_combination|
        if win_combination.all? { |index| @board.status[index] == 'X' } ||
            win_combination.all? { |index| @board.status[index] == 'O' }
          return win_combination
        end
      end
    else false
    end
  end

  def full?
    @board.status.all? { |i| i == 'X' || i == 'O' }
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end
end
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
    [6, 4, 2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = (input.to_i) - 1
  end

  def move(index, value = 'X')
    @board[index] = value
    return @board
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    elsif @board[index] == "X" || @board[index] == "O"
      return true
    end
  end

  def valid_move?(index)
    if index >= 0 && index <= 8
      if !(position_taken?(index))
        return true
      end
    end
    return false
  end

  def turn_count
    turns = 0
    @board.each do |position|
      if position == "X" || position == "O"
        turns += 1
      end
    end
    return turns
  end

  def current_player
    turns = self.turn_count
    current_player = (turns.to_i % 2) == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    value = self.current_player

    if valid_move?(index)
      move(index, value)
      display_board
      return @board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if combo.all?{|index| position_taken?(index)}

        first_value = @board[combo[0]]
        second_value = @board[combo[1]]
        third_value = @board[combo[2]]

        if first_value == second_value && first_value == third_value
          return combo
        end
      end
    end
    return false
  end

  def full?
    @board.all?{|element| !(element == " ")}
  end

  def draw?
    if full? && !(won?)
      return true
    end
  end

  def over?
    if full?
      return true
    end

    if draw?
      return true
    end

    if won?
      return true
    end
    return false
  end

  def winner
    if over?
      winning_positions = self.won?
      value = @board[winning_positions[0]]
      if value.include?('X')
        return 'X'
      elsif value.include?('O')
        return 'O'
      else
        return nil
      end
    end
  end

  def play
    while over? == false
      turn
    end

    if won?
      win = self.winner
      puts "Congratulations #{win}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end

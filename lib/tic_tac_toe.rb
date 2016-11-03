class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(index)
    index = index.to_i - 1
  end

  def move(position, character="X")
    index = position.to_i - 1
    @board[index] = character
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(input)
    index = input_to_index(input)
    if index.between?(0, 8) && !position_taken?(index)
      true
    else
      false
    end
  end

  def turn
    character = current_player
    puts "Please enter 1-9:"
    input = gets.strip
    #index = input.to_i - 1
    if valid_move?(input)
      move(input, character)
    else
      turn
    end
    display_board
  end

  def turn_count
    counter = 0
    @board.each do |space|
      if space == "X" || space == "O"
         counter += 1
      end
    end
    counter
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
        return combo
      elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
        return combo
      end
    end
    false
  end

  def full?
    @board.all? do |spot|
      spot == "X" || spot == "O"
    end
  end

  def draw?
    if full? && !won?
      true
    elsif !full? && !full?
      false
    end
  end

  def over?
    if won? || draw? || full?
      true
    end
  end

  def winner
    if won?
      @board[won?[0]]
    else
      nil
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end

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
    [0,4,8],
    [2,4,6]
  ]

  def display_board()
    if(@board != nil && @board.any?)
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
  end

  def input_to_index(input_to_index)
    input_to_index = input_to_index.to_i - 1
    return input_to_index
  end

  def move(index, value)
    if(index > -1 && index < 9)
      @board[index] = value;
    end
    return @board
  end

  def valid_move?(index)
    if index < @board.size && index > -1
      return false if position_taken?(index)
    else
      return false
    end
    true
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    end
    false
  end

  def turn
    isValid = false
    while isValid == false
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      isValid = valid_move?(index)
      if isValid
        move(index, current_player())
        display_board()
      end
    end
    return @board
  end

  def turn_count
    counter = 0
    @board.each do |element|
      if element == "X" || element == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    counter = turn_count()
    if counter % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    if !@board.empty?()
      WIN_COMBINATIONS.each do |combination|
        position_1 = @board[combination[0]]
        position_2 = @board[combination[1]]
        position_3 = @board[combination[2]]

        if ((position_1 == "X" && position_2 == "X" && position_3 == "X") ||
          (position_1 == "O" && position_2 == "O" && position_3 == "O"))
          return combination
        end
      end
    end
    false
  end

  def full?
    @board.each do |element|
      if element == " " || element == ""
        return false
      end
    end
    true
  end

  def draw?
    if full?() == true
      if won?() == false
        return true
      end
    end
    false
  end

  def over?
    if full?() || won?() || draw?()
      true
    else
      false
    end
  end

  def winner
    isWin = won?()
    if isWin != false
      return @board[isWin[0]]
    end
  end

  def play
    until over?()
      turn()
    end
    if winner().nil? == false
      puts "Congratulations #{winner()}!"
    else
      puts "Cat\'s Game!"
    end
    return @board
  end

end

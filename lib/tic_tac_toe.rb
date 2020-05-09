class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
  ]

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def board
    @board
  end

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index (input)
    index = input.to_i - 1
    return index
  end

  def move (index, token = 'X')
    @board[index] = token
  end

  def position_taken? (index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    else
      return true
    end
  end

  def valid_move? (index)
    pos = position_taken?(index)
    if index >= 0 && index <= 8 && pos == false
      return true
    else
      return false
    end
  end

  def turn_count()
    count = 0
    @board.each do |element|
      if element == 'X' || element == 'O'
        count += 1
      end
    end
    return count
  end

  def current_player()
    move = turn_count()
    if move%2 == 0
      return 'X'
    else
      return 'O'
    end

  end

  def won? ()

    i = 0
    8.times do
      if @board[WIN_COMBINATIONS[i][0]] == 'X' && @board[WIN_COMBINATIONS[i][1]] == 'X' && @board[WIN_COMBINATIONS[i][2]] == 'X'
        return WIN_COMBINATIONS[i]
      elsif @board[WIN_COMBINATIONS[i][0]] == 'O' && @board[WIN_COMBINATIONS[i][1]] == 'O' && @board[WIN_COMBINATIONS[i][2]] == 'O'
        return WIN_COMBINATIONS[i]
      end
      i += 1
    end
    return false
  end

  def full?
    @board.each do |element|
      if element == "" || element == " " || element == nil
        return false
      end
    end
    return true
  end

  def draw?
    if won? == false && full? == true
      return true
    else
      return false
    end
  end

  def over?
    if draw? == true
      return true
    elsif won? != false
      return true
    elsif full? == false
      return false
    end
  end

  def winner
    if won? != false
      arr = won?
      if @board[arr[0]] == 'X'
        return 'X'
      else
        return 'O'
      end
  elsif full? == false || draw? == false
    return nil
  end
  end

  def turn
    puts "Choose a position between 1-9"
    current = ""
    input = gets.strip
    index = input_to_index(input)
    current = current_player
    if valid_move?(index) == true
      move(index, current)
      display_board()
    else
      puts "Invalid move, try again"
      turn()
    end
  end

  def play
    while over? != true
      turn
    end

    if won? != false
      winningPlayer = winner
      puts "Congratulations #{winningPlayer}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end

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

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(input,token = "X")
    input = input.to_i
    index = input - 1
    @board[index] = token
  end

  def position_taken?(index)
    if (@board[index] == " ") || (@board[index] == "" || (@board[index] == nil))
      return false
    else
      return true
    end
  end

  def valid_move?(input)
    input = input.to_i
    index = input - 1
    if (index >= 0 && @board[index] == " ")
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input,current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |turn|
      if turn == 'X' || turn == 'O'
        count += 1
      end
    end
    return count
  end

  def current_player
    turn = turn_count + 1
    turn % 2 != 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      win_index_1 = combo[0]
      win_index_2 = combo[1]
      win_index_3 = combo[2]
      if (@board[win_index_1] == 'X' && @board[win_index_2] == 'X' && @board[win_index_3] == 'X') ||
        (@board[win_index_1] == 'O' && @board[win_index_2] == 'O' && @board[win_index_3] == 'O')
        return combo
      end
    end
    return false
  end

  def full?
    full = [0,1,2,3,4,5,6,7,8]
    check = full.all? do |index|
      position_taken?(index)
    end
    return check
  end

  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end

  def over?
    if (draw? || won?)
      return true
    else
      return false
    end
  end

  def winner
    if (over? && !draw?)
      winpos = won?
      return @board[winpos[0]]
    else
      return nil
    end
  end

  def play
    while (!over?) do
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end


end

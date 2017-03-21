class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [0, 4, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 4, 6],
    [2, 5, 8],
    [3, 4, 5],
    [6, 7, 8]
  ]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    index = user_input.to_i - 1
    return index
  end

  def move(index, player)
    @board[index] = player
    @board
  end

  def turn_count
    count = 0

    @board.each do |space|
      if !(space == " ")
        count += 1
      end
    end

    count
  end

  def current_player
    count = turn_count
    if (count % 2 == 0 || count == 0)
      return "X"
    else
      return "O"
    end
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move? (index)
    if ((index.between?(0, 8)) && !(position_taken?(index)))
      return true
    else
      return false
    end
  end

  def turn
    player = current_player
    puts "Please enter 1-9:"
    display_board
    index = input_to_index(gets.strip)
    if (valid_move?(index) == true)
      move(index, player)
    else
      turn
    end
  end

  def won?
    if @board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      return false
    end

    WIN_COMBINATIONS.each do |combo|
      player = @board[combo[0]]

      position_2 = @board[combo[1]]
      position_3 = @board[combo[2]]

      if ((player == position_2) && (player == position_3) && (player != " "))
        return combo
      end
    end

    return false
  end

  def full?
    @board.all?{|token| token == "X" || token == "O"}
  end

  def draw?
    if ((won? == false) && (full? == true))
      return true
    else
      return false
    end
  end

  def over?
    if won?
      return true
    elsif draw?
      return true
    elsif full?
      return true
    else
      return false
    end
  end

  def winner
    if combo = won?
      @board[combo[0]]
    end
  end

  def play
    turn until over?
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end

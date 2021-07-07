class TicTacToe
  WIN_COMBINATIONS = [
  #rows
    [0,1,2],
    [3,4,5],
    [6,7,8],
  #columns
    [0,3,6],
    [1,4,7],
    [2,5,8],
  #diagonals
    [0,4,8],
    [2,4,6]
  ]

  def initialize()
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def play
    while over? == false
      turn()
    end
    if winner()
      puts "Congratulations " + winner() + "!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def turn
    valid_input = false
    while !valid_input
      puts "Please enter 1-9:"
#      index = input_to_index(gets.strip)
      user_input = gets.strip
      if (valid_move?(user_input))
        move(user_input, current_player())
        display_board
        valid_input = true
      else
        puts "Invalid input"
      end
    end
  end

  def move(user_input, player="X")
    @board[input_to_index(user_input)] = player
  end

  def turn_count
    remaining_turns = @board.count(" ");
    9 - remaining_turns
  end

  def current_player
    (turn_count() % 2) == 0 ? "X" : "O"
  end

  def position_taken?(user_input)
#    index = input_to_index(user_input)
    index = user_input
    !(@board[index].nil? || @board[index] == " ")
  end

  def input_to_index(user_input)
    index = user_input.to_i - 1
  end

  def valid_move?(user_input)
    index = input_to_index(user_input)
    if (index >= 0) && (index <= 8)
      return !position_taken?(index)
    end
    false
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if (position_taken?(combo[0])) && (@board[combo[0]]==@board[combo[1]]) && (@board[combo[1]]==@board[combo[2]])
        return combo
      end
    end
    false
  end

  def full?
    return false if (@board.index(" "))
    true
  end

  def draw?
    game_won = won?
    board_full = full?
    return true  if board_full  && !game_won
    return false if !board_full && !game_won
    return false if game_won
  end

  def over?
    return true if won? || draw? || full?
    false
  end

  def winner
    combo = won?
    @board[combo[0]] if combo
  end

end

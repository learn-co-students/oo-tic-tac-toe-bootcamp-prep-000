class TicTacToe
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

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " ", ]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    return user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    player = current_player

    if valid_move?(index)
      move(index, player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |index|
      if index == 'X' || index == 'O'
        counter += 1
      end
    end
    counter
  end

  def current_player
    if(turn_count % 2 == 0)
      'X'
    else
      'O'
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if @board[win_combo[0]] == 'X' && @board[win_combo[1]] == 'X' && @board[win_combo[2]] == 'X'
        return win_combo
      elsif @board[win_combo[0]] == 'O' && @board[win_combo[1]] == 'O' && @board[win_combo[2]] == 'O'
        return win_combo
      end
    end
    return false
  end

  def full?
    @board.all? do |position|
      position == 'X' || position == 'O'
    end
  end

  def draw?
    if !won? && full?
      return true
    end
  end

  def over?
    if won? || draw?
      return true
    end
  end

  def winner
    who_won = won?
    if who_won
      return @board[who_won[0]]
    else
      return nil
    end
  end

  def play
    while !over?
      turn
    end

    if winner == 'X'
      puts "Congratulations X!"
    elsif winner == 'O'
      puts "Congratulations O!"
    else
      puts "Cats Game!"
    end
  end

end

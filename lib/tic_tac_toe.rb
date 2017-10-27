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

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count("X") + @board.count("O")
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if position_taken?(combo[0]) && position_taken?(combo[1]) && position_taken?(combo[2])
        if @board[combo[0]] == @board[combo[1]]  && @board[combo[1]] == @board[combo[2]]
          return combo
        end
      end
    end
    false
  end

  def full?
    !@board.include? " "
  end

  def draw?
    if(!won?)
      if(full?)
        true
      end
    else
      false
    end
  end

  def over?
    if(won? || full? || draw?)
      true
    else
      false
    end
  end

  def winner
    win_combo = won?
    if(win_combo == false)
      nil
    else
      @board[win_combo[0]]
    end
  end

  def play
    until(over?)
      turn
    end

    if(won?)
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end
end

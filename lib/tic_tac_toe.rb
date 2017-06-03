  class TicTacToe

    def initialize
      @board = [" "," "," "," "," "," "," "," "," "]
    end

  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6],
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

  def move(index, current_player="X")
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
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "please input a valid move"
      turn
    end
  end


  def won?
    WIN_COMBINATIONS.each do |combo|
      bd0 = combo[0]
      bd1 = combo[1]
      bd2 = combo[2]

      if @board[bd0] == "X" && @board[bd1] == "X" && @board[bd2] == "X"
        return combo
      elsif @board[bd0] == "O" && @board[bd1] == "O" && @board[bd2] == "O"
        return combo
      end
    end
    return false
  end

  def full?
    @board.all? { |e| e == "X" || e == "O" }
  end

  def over?
    won? || full?
  end

  def draw?
    !won? && full?
  end

  def winner
    if won?
      x = won?
      y = @board[x[0]]
      return y
    end
    return nil
  end

  def turn_count
    count = 0
    @board.each do |mark|
      if mark == "X" || mark == "O"
        count += 1
      end
    end
    count
  end

  def current_player

    if turn_count % 2 == 0
      "X"
    else
      "O"
  end
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  # Define your play method below
  def play
  while !over?
    turn
    if draw?
      puts "Cat's Game!"
      return
    end
  end
    if draw?
      puts "Cat's Game!"
    end

    if winner
      puts "Congratulations #{winner}!"
    end
  end

end

class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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
    print " #{@board[0]} | #{@board[1]} | #{@board[2]} \n"
    11.times{ print "-" }
    puts
    print " #{@board[3]} | #{@board[4]} | #{@board[5]} \n"
    11.times{ print "-" }
    puts
    print " #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(input, character="X")
    index_tofill = input_to_index(input)
    @board[index_tofill] = character
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    elsif !(@board[index].nil? || @board[index] == "")
      return false
    end
  end

  def valid_move?(index)
    count = input_to_index(index)
    if position_taken?(count) == true || count.between?(0,8) == false
      return false
    else
      return true
    end
  end

  def turn
    puts "Please enter 1-9:"
    index = gets.strip
    if valid_move?(index) == true
      move(index, current_player)
      display_board
    else
      turn
    end
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
    count = turn_count
    count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |win_arr|
       test = win_arr.all? do |ele|
        @board[ele] == "X" || win_arr.all? do |ele|
         @board[ele] == "O"
       end
      end
      if test == true
      return win_arr
      end
    end
    false
  end

  def full?
    @board.all? do |space|
      space == "X" || space == "O"
    end
  end

  def draw?
    if full? == true && won? == false
      return true
    elsif won? == false && full? == false
      return false
    else
      return false
    end
  end

  def over?
    full? == true || draw? == true || won? != false
  end

  def winner
    won? != false ? @board[won?[1]].to_s : nil
  end

  def play
    until over? == true
      turn
    end
      if won? != false
        win_person = winner
        puts "Congratulations #{win_person}!"
      else
        puts "Cats Game!"
    end
  end


end

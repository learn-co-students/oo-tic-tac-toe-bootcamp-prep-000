class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  WIN_COMBINATIONS = [[0,1,2], [3, 4, 5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

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
    counter = 0
    @board.each do |space|
      if space == "X" || space == "O"
        counter +=1
      end
    end
    return counter
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
  end
  end

  def won?
    winning_array = []
    x_count = 0
    o_count = 0
    WIN_COMBINATIONS.each do |win_possibility|
      win_possibility.each do |check_item|
        if @board[check_item] == "X"
          x_count +=1
        elsif @board[check_item] == "O"
            o_count +=1
        end
      end
      if x_count == 3
        return win_possibility
      elsif o_count == 3
        return win_possibility
      else
        x_count = 0
        o_count = 0
      end
    end
    return false
  end

  def full?
    @board.none?{|i| i == " "}
  end

  def draw?
    full? == true && won? == false
  end


  def winner
    x_win = 0
    o_win = 0
    check_array = won?
    if check_array == false
      return nil
    end
    check_array.each do |i|
      if @board[i] == "X"
        x_win += 1
      end
    end
    if x_win == 3
      return "X"
    end
    check_array.each do |i|
      if @board[i] == "O"
        o_win += 1
      end
    end
    if o_win == 3
      return "O"
    end
  end

  def over?
    won? != false || draw? == true || full? == true
  end

  def play
    until over?
      turn
    end
    if won? != false
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end

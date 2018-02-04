class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left column
    [1,4,7], #middle column
    [2,5,8], #right column
    [0,4,8], #diagonal back
    [6,4,2], #diagonal forward
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
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
    i = gets.strip
    index = input_to_index(i)
    m = valid_move?(index)
    if m == true
      move(index, current_player)
      display_board
    else m == false
      until m == true
        puts "Sorry, that was an invalid move. Please enter 1-9:"
        display_board
        i = gets.strip
        index = input_to_index(i)
        m = valid_move?(index)
        move(index, current_player)
      end
    end
  end

  def turn_count
    count = 0
    @board.each do |i|
      if i == "X" || i == "O"
        count += 1
      end
    end
    count
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      result = []
      win_combination.each do |i|
        result << @board[i]
      end
      if result == ["X","X","X"] || result == ["O","O","O"]
        return win_combination
      end
    end
      return false
  end

  def full?
    @board.all? {|i| i == "X" || i == "O"}
  end

  def draw?
    (full? && !won?) ? true : false
  end

  def over?
    (won?|| draw?) ? true : false
  end

  def winner
    if won?
      test = won?[0]
      # board[test] == "X" ? "X" : "O"
      if @board[test] == "X"
        return "X"
      elsif @board[test] == "O"
        return "O"
      end
    else
      return nil
    end
  end


  def play
    until over? == true
      # display_board
      turn
    end
    if draw? == true
         puts "Cat's Game!"
    else won?
       puts "Congratulations #{winner}!"
     end
  end

end

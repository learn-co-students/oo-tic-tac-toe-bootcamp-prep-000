class TicTacToe
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

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

  def input_to_index(number)
    number.to_i - 1
  end

  def move(index, player)
    @board[index] = player;
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    if position_taken?(index) || !index.between?(0, 8)
      false
    else
      true
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
    else turn
    end
    display_board
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def turn_count
    counter = 0
    @board.each do |position|
      if position != " "
        counter += 1
      end
    end
    counter
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      if combination.all? {|a| @board[a] == "O"}
        winner = "O"
        return combination
      elsif combination.all? {|a| @board[a] == "X"}
        winner = "X"
        return combination
      end
    end
    return false
  end

  def full?
    @board.each do |position|
      if position == " "
        return false
      end
      true
    end
  end

  def draw?
    if full? &&  !won?
      true
    else false
    end
  end

  def over?
    if draw? || won?
      true
    else false
    end
  end

  def winner
    if won?
      return @board[won?[0]] #Grabs the value from the first element in the winning array...
    else return nil
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end

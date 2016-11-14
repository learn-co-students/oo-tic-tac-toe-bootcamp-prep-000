class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end

  def board
    @board
  end

  WIN_COMBINATIONS = [
    [0,1,2], #Top row
    [3,4,5], #Middle row
    [6,7,8], #Bottom row
    [0,4,8], #Diagonal 1
    [2,4,6], #Diagonal 2
    [0,3,6], #Left column
    [1,4,7], #Middle column
    [2,5,8], #Right column
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, value = "X")
    index = position - 1
    @board[index] = value
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(position)
    index = position.to_i - 1
    !position_taken?(index) && index.between?(0, 8)
  end

  def turn
    display_board
    puts "Please enter 1-9"
    input = gets.strip
    position = input.to_i
    if valid_move?(position)
      move(position, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |element|
      if element == "X" || element == "O"
        counter += 1
      end
    end
    counter
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
      win_x = combo.all?{|index| @board[index] == "X"}
      win_o = combo.all?{|index| @board[index] == "O"}
      if win_x == true || win_o == true
        return combo
      end
    end
    false
  end

  def full?
    full = !@board.include?(" ")
    full
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won? != false
      @board[won?[0]]
    end
  end

  def play
    while !over?
      turn
    end
    if draw? == true
      puts "Cats Game!"
    elsif won? != false
      puts "Congratulations #{winner}!"
    end
  end

end

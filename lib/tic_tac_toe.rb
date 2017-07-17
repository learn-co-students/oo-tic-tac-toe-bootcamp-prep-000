class TicTacToe
  def initialize
    @board = [" "] * 9
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

  def move(index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] == "X" || @board[location] == "O"
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count { |position| position == "X" || position == "O" }
  end

  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
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

  def won?
      WIN_COMBINATIONS.each do |combo|
        if combo.all? {|position| @board[position] == "X"} || combo.all? {|position| @board[position] == "O"}
          return combo
        end
      end
      return false
  end

  def full?
    @board.all? {|position| position == "X" || position == "O"}
  end

  def draw?
    full? && won? == false
  end

  def over?
    draw? || won? != false
  end

  def winner
    index = won?
    if index
      @board[index[0]]
    else
      nil
    end
  end

  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

end

class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [6,4,2],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

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

  def move(index, token="X")
    @board[index] = token
  end

  def position_taken?(index)
    case @board[index]
    when "X", "O"
      true
    else
      false
    end
  end

  def valid_move?(index)
    if index >= 0 && index <= 8 && !position_taken?(index) then
      true
    else
      false
    end
  end

  def turn
    index = nil
    loop do
      puts "What's your move, partner? (1-9):"
      index = input_to_index(gets.strip)
      if valid_move?(index) then
        break
      end
    end
    move(index, current_player)
    display_board
  end

  def turn_count
    turns = 0
    @board.each do |cell|
      case cell
      when "X", "O"
        turns += 1
      end
    end
    turns
  end

  def current_player
    if turn_count % 2 == 0 then
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      if combination.all? { |e| @board[e] == "X" } || combination.all? { |e| @board[e] == "O" }
        return combination
      end
    end
    false
  end

  def full?
    @board.each do |e|
      case e
      when " ", "", nil
        return false
      end
    end
    true
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full?
  end

  def winner
    winner = nil
    WIN_COMBINATIONS.each do |combination|
      if combination.all? { |e| @board[e] == "X" }
        winner = "X"
      elsif combination.all? { |e| @board[e] == "O" }
        winner = "O"
      end
    end
    winner
  end

  def play
    until over? || draw? do
      turn
    end

    if draw? then
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

end

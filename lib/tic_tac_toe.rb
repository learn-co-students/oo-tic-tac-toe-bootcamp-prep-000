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
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    x = input.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    if (0..8).include?(index) && @board[index] == " "
      true
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      token = current_player
      move(index, token)
    else
      turn
    end
    display_board
  end

  def turn_count
    count = 0
    @board.each do |x|
      if x != " "
        count += 1
      end
    end
    count
  end

  def current_player
    x = turn_count
    (x%2==0) ? "X" : "O"
  end

  def won?
    winner = nil
    WIN_COMBINATIONS.each do |wc|
      x1 = wc[0]
      x2 = wc[1]
      x3 = wc[2]

      pos1 = @board[x1]
      pos2 = @board[x2]
      pos3 = @board[x3]

      if pos1 == "X" && pos2 == "X" && pos3 == "X"
        winner = wc
      elsif pos1 == "O" && pos2 == "O" && pos3 == "O"
        winner = wc
      end
    end
    winner
  end

  def full?
    @board.none?{|x| x == " "}
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      return @board[won?[0]]
    end
  end

  def play
    turn until over?
    if winner
      system "clear"
      display_board
      puts "Congratulations #{winner}!"
    elsif draw?
      system "clear"
      display_board
      puts "Cat's Game!"
    end
  end
end

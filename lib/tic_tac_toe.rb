class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize()
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def play
    
    puts "Welcome to Tic Tac Toe!"
    display_board
    
    until over?
      turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
    
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !position_taken?(input.to_i-1)
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def full?
    @board.all?{|index| !(index.nil? || index == " ")}
  end

  def over?
    draw? || !!won? || full?
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def move(location, token)
    @board[location.to_i-1] = token
  end

  def won?
    WIN_COMBINATIONS.detect{|combo|
      combo.all?{|index| position_taken?(index)} and
      (combo.all?{|index| @board[index] == 'X'} or
      combo.all?{|index| @board[index] == 'O'})
    }
  end

  def draw?
    !(!!won?) && full?
  end

  def winner
    if over?
      @board[won?[0]]
    end
  end

  def position(location)
    @board[location.to_i]
  end

  def position_taken?(location)
    !(position(location).nil? || position(location) == " ")
  end
end
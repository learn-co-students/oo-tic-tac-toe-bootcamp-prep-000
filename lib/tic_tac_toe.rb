class TicTacToe
  def initialize(board = nil)
    @board = Array.new(9, " ")
  end

  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    #horizonal rows
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
  
    #vertical rows
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
  
    #diagonals
    [0, 4, 8],
    [2, 4, 6]
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
      move(index, current_player())
      display_board()
    else
      turn()
    end
  end
  
  def turn_count
    count = 0
    @board.each do |space|
      if space == "X" || space == "O"
        count += 1
      end
    end
    count
  end

  def current_player
    turn_count() % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      @board[win_combination[0]] == @board[win_combination[1]] &&
      @board[win_combination[1]] == @board[win_combination[2]] &&
      position_taken?(win_combination[0])
    end
  end

  def full?
    return @board.all?{|i| i != " "}
  end
  
  def draw?
    !won?() && full?()
  end
  
  def over?
    full?() || won?()
  end
  
  def winner
    if won = won?()
      @board[won[0]]
    end
  end

  def play
    while !over?()
      turn()
      if won?() || draw?()
        break
      end
    end
  
    if draw?()
      puts "Cat's Game!"
    elsif won?()
      winner = winner()
      puts "Congratulations " + winner + "!"
    end
  end
end
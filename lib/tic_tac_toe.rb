class TicTacToe
  WIN_COMBINATIONS = [
     # Row wins
     [0,1,2],
     [3,4,5],
     [6,7,8],
     # Column wins
     [0,3,6],
     [1,4,7],
     [2,5,8],
     # Diag wins
     [0,4,8],
     [6,4,2]
  ]

  def initialize
    @board = Array.new(9, " ")
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def display_board
    row1 = " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    row2 = " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    row3 = " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    seperator = "\n-----------\n"
    puts [row1,row2,row3].join(seperator)
  end

  def move(position, token)
    index = input_to_index(position)
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(position)
    index = input_to_index(position)
    0 <= index && index <= 9 && !(position_taken?(index))
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position)
      token = current_player
      move(position, token)
      display_board
    else
      puts "Invalid move!"
      turn
    end
  end


  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end


  def current_player
    x_count = @board.count{|token| token == "X"}
    o_count = @board.count{|token| token == "O"}
    if x_count > o_count then "O" else "X" end
  end

  def full?
    @board.all? {|space| space == "X" || space == "O"}
  end

  def draw?()
    !won? && full?
  end

  def over?()
     won? || draw?
  end

  def winner
    winning_combo = won?
    if(winning_combo)
      return @board[winning_combo.first]
    else
      return nil
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      x_wins = combo.all? {|i| @board[i] == "X"}
      y_wins = combo.all? {|i| @board[i] == "O"}
      if(x_wins || y_wins)
        return combo
      end
    end
    return nil
  end

  def play()
    until over?
      turn
    end

    if won?
      victor = winner
      puts "Congratulations #{victor}!"
    else
      puts "Cats Game!"
    end
  end

end

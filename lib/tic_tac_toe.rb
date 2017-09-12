class TicTacToe
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
  def initialize()
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def play()
    while !over?()
      turn()
    end

    puts "Cat's Game!" if draw?()
    puts "Congratulations #{winner()}!" if won?()
  end

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(n)
    n.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    return !( @board[index] == " " || @board[index] == "" || @board[index] == nil )
  end

  def valid_move?(index)
    return ( index >= 0 && index < @board.length ) && !position_taken?(index)
  end

  def turn()
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player())
      display_board()
    else
      puts "That is not a valid move."
      turn()
    end
  end

  def current_player()
    (turn_count() % 2 == 0) ? "X" : "O"
  end

  def turn_count()
    turns = 0
    @board.each do |x|
      if x == "X" || x == "O"
        turns += 1
      end
    end
    return turns
  end

  def won?()
    arrays = WIN_COMBINATIONS.select { |c| ( @board[c[0]] == @board[c[1]] && @board[c[0]] == @board[c[2]] ) && ( @board[c[0]] == "X" || @board[c[0]] == "O" ) }
    if arrays == []
      return false
    else
      return arrays[0]
    end
  end

  def full?()
    arrays = @board.select { |s| s == " " || s == "" }
    return arrays == []
  end

  def draw?()
    full?() && !won?()
  end

  def over?()
    won?() || full?()
  end

  def winner()
    winner = won?()
    if winner
      @board[winner[0]]
    else
      nil
    end
  end

end

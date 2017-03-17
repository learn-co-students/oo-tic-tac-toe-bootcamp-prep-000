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

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-" * 11
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-" * 11
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(i)
    i.to_i - 1
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count {|token| token == "X" || token == "O"}
  end

  def move(position, char)
    @board[position] = char
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
    char = current_player
    if valid_move?(index)
      move(index, char)
      display_board
    else
      turn
    end
    exit if turn_count == 10
  end

  def won?
    win = false
    WIN_COMBINATIONS.each do |combination|
      if @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X"
        win = combination
      elsif @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
        win = combination
      end
    end
    return win
  end

  def full?
   !@board.include?(" ")
  end

  def draw?
   full? && !won?
  end

  def over?
   won? || draw?
  end

  def winner
     if won?
      winning_combination = won?
      return @board[winning_combination[0]]
    else
      return nil
    end
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end

end

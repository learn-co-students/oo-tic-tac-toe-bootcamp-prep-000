class TicTacToe
  WIN_COMBINATIONS =  [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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

  def move(position, player)
    @board[position] = player
  end

  def position_taken?(position)
    @board[position] != " " && @board[position] != ""
  end

  def valid_move?(position)
    position.between?(0,8) && !position_taken?(position)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    position = input_to_index(input)
    if valid_move?(position)
      move(position, current_player)
      display_board
    elsif !over?
      puts "Not a valid move!"
      turn
    end
  end

  def turn_count
    return @board.count{ |position| position == "X" || position == "O"}
  end

  def current_player
    if (turn_count%2 == 0)
      return "X"
    else
      return "O"
    end
  end

  def won?
     winning = WIN_COMBINATIONS.detect{ |combo| combo.all? { |position| @board[position] == "X"} || combo.all? { |position| @board[position] == "O"}}
     if winning == []
       return false
     else
       return winning
     end
  end

  def full?
    (0..8).all? {|x| position_taken?(x)}
  end

  def draw?
    if full? && !won?
      return true
    end
  end

  def over?
    if draw? || won?
      return true
    end
  end

  def winner
    winner = won?
      if winner
        return @board[winner[0]]
      end
  end

  def play
    t = 1
    while (t <= 9) do
      break if over?
      turn
      t += 1
    end

    if draw?
      puts "Cat's Game!"
    end

    if won?
      puts "Congratulations #{winner}!"
    end


  end

end

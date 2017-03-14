class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS  = [
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

  def move(index, current_player)
    @board[index.to_i - 1] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    i = index.to_i - 1
    i.between?(0,8) && !position_taken?(i)
  end

  def turn
    puts "Please enter 1-9:"
    index = gets.strip
    if valid_move?(index)
      player_token = current_player
      move(index, player_token)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{ |token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |win|
      index_1 = win[0]
      index_2 = win[1]
      index_3 = win[2]
      if @board[index_1] == "X" && @board[index_2] == "X" && @board[index_3] == "X"
        return win
      elsif @board[index_1] == "O" && @board[index_2] == "O" && @board[index_3] == "O"
        return win
      end
    end
    false
  end

  def full?
    @board.all? { |item| item == "X" || item == "O"}
  end

  def draw?
    !won? && full? ? true : false
  end

  def over?
    draw? || won? ? true : false
  end

  def winner
    if won?
      win = won?
      index = win[0]
      return @board[index]
    end
    nil
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end

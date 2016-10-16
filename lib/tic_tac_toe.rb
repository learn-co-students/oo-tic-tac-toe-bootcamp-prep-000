class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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

  def move(index, current_player)
    @board[index.to_i - 1] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index = index.to_i - 1
    index.between?(0,8) && !position_taken?(index)
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

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count {|token| token == "X" || token == "O"}
  end

  def won?
    WIN_COMBINATIONS.each do |win_comb|
      index_1 = win_comb[0]
      index_2 = win_comb[1]
      index_3 = win_comb[2]
      if @board[index_1] == "X" && @board[index_2] == "X" && @board[index_3] == "X"
        return win_comb
      elsif @board[index_1] == "O" && @board[index_2] == "O" && @board[index_3] == "O"
        return win_comb
      end
    end
    nil
  end

  def full?
    @board.all?{|player_char| player_char == "X" || player_char == "O"}
  end

  def draw?
    return !won? && full? ? true : false
  end

  def over?
    return won? || draw? || full?
  end

  def winner
    if draw? || !won?
      return nil
    elsif @board[won?[0]] == "X"
      return "X"
    elsif @board[won?[0]] == "O"
      return "O"
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end

class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end


  def display_board   #Reader
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, current_player)    #Writer
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if position_taken?(index)
      return false
    elsif !index.between?(0, 8)
      return false
    else
      return true
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def won?
    WIN_COMBINATIONS.each do |win_index|
      position_1 = win_index[0].to_i
      position_2 = win_index[1].to_i
      position_3 = win_index[2].to_i
      if @board[position_1] == "X" && @board[position_2] == "X" && @board[position_3] == "X"
        return win_index
      elsif @board[position_1] == "O" && @board[position_2] == "O" && @board[position_3] == "O"
        return win_index
      else
        false
      end
    end
    false
  end

  def full?
    @board.all? do |position|
      position=="X" || position=="O"
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if !won?
      return nil
    else
      win_positions = won?
      winner = win_positions[0]
      return @board[winner]
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end

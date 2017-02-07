class TicTacToe
    def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position_choice, current_player = "X")
    index = position_choice.to_i - 1
    @board[index] = current_player

  end

  def position_taken?(index)
    !(@board[index.to_i].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.to_i.between?(1,9) && !position_taken?(index.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    index = gets.to_i
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    status = false
      if @board.all? {|square| square === " "}
        return status
      end
      WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]
        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]
        if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
           (position_1 == "O" && position_2 == "O" && position_3 == "O")
           status = true
          return win_combination # return the win_combination indexes that won.
        else
          status = false
        end
      end
      return status
  end

  def full?
  	@board.all? {|square| square == "X" || square == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    if draw? == true || won? != false
      true
    else
      false
    end
  end

  def winner
    if won? != false
      if @board.count("X") > @board.count("O")
        winner = "X"
      else
        winner = "O"
      end
    end
  end

  def play
    until over? == true
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif  winner == "O"
      puts "Congratulations O!"
    elsif draw? == true
      puts "Cats Game!"
    end
  end
end

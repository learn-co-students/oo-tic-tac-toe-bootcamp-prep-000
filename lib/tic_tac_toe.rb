class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, ' ')
  end

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
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(num)
    num.to_i - 1
  end

  def move(position, token="X")
    @board[position] = token
  end

  def position_taken?(position)
      @board[position] == "X" || @board[position] == "O" ? (return true) : (return false)
  end

  def valid_move?(position)
    if position.between?(0,8)
      position_taken?(position) == false ? (return true) : (return false)
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    pos = input_to_index(input)
    if valid_move?(pos)
      move(pos, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    if @board == [" "," "," "," "," "," "," "," "," "]
        return false
    else
      for win_combo in WIN_COMBINATIONS
      #puts win_combo[0] == board.index(board[win_combo[0]])
        win_index_1 = win_combo[0]
        win_index_2 = win_combo[1]
        win_index_3 = win_combo[2]

        pos_1 = @board[win_index_1]
        pos_2 = @board[win_index_2]
        pos_3 = @board[win_index_3]

        if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
          return win_combo
        elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
          return win_combo
        end
      end
      return false
    end
  end

  def full?
    @board.none?{|i| i == " "}
  end

  def draw?
    !won? && full? ? true : false
  end

  def over?
    won? || draw? || full? ? true : false
  end

  def winner
    if over? && @board[won?[0]] == "X" && @board[won?[1]] == "X" && @board[won?[2]] == "X"
      return "X"
    elsif over? && @board[won?[0]] == "O" && @board[won?[1]] == "O" && @board[won?[2]] == "O"
      return "O"
    else
      return nil
    end
  end

  def play
    until over?
      if won?
        return "Congratulations #{winner}!"
      elsif draw?
        return "Cats Game!"
      else
        turn
      end
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end
class TicTacToe
  
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

  def position_taken?(board_index)
    @board[board_index] != " " && @board[board_index] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
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

  def current_player
    current_player = turn_count.even?? "X" : "O"
    return current_player
  end

  def turn_count
    n_turns = 0
    @board.each do |e|
      if(e == "X" || e == "O")
        n_turns += 1
      end
    end
    return n_turns
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      win_index_0 = combo[0]
      win_index_1 = combo[1]
      win_index_2 = combo[2]
      win_position_0 = @board[win_index_0]
      win_position_1 = @board[win_index_1]
      win_position_2 = @board[win_index_2]
      if ( (win_position_0 == "X" && win_position_1 == "X" && win_position_2 == "X") ||  (win_position_0 == "O" && win_position_1 == "O" && win_position_2 == "O") )
          return combo
      end
    end
    return false
  end

  def full?
    @board.all? {|symbol| symbol == "X" || symbol == "O"}
  end

  def draw?
    if (!won? && full?)
      return true
    end
    return false
  end

  def over?
    if(won? || draw? || full?)
      return true
    end
    return false
  end

  def winner
    win_combo = won?
    if(win_combo == false)
      return nil
    elsif win_combo.all?{|i| @board[i] == "X"}
      return "X"
    else
      return "O"
    end
  #  won?(board) && board[won?(board)[0]]
  end

  def play
    while(!over?)
      turn
    end
    if(won?)
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end


end
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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

  def input_to_index(user_input)
    user_input.to_i ? user_input.to_i - 1 : -1
  end

  def move(position, player_token)
    @board[position] = player_token
  end

  def position_taken?(position)
    if @board[position] == " " || @board[position] == "" || @board[position] == nil
      false
    elsif @board[position] == "X" || @board[position] == "O"
      true
    else
      nil
    end
  end

  def valid_move?(position)
    (position_taken?(position) == false || position_taken?(position) == nil) && (position.between?(0,8)) ? true : false
  end

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

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    input = input_to_index(input)
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      while !valid_move?(input)
        puts "Please enter 1-9:"
        input = gets.strip
        input = input_to_index(input)
      end
    end
  end


end

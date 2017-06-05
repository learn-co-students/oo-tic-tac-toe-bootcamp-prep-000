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

  def input_to_index(user_input)
  user_input.to_i - 1
  end

  def move(index, player)
    @board[index] = player
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
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    # detect returns win_combination or nil, nil is not the same as false so you can't do won?(board) == false, only won?(board) == nil
    # WIN_COMBINATIONS.find{|x| board[x[0]] == board[x[1]] && board[x[1]] == board[x[2]] && board[x[1]] != " "}
    WIN_COMBINATIONS.detect do |win_combination| # first loop [0,1,2], second loop [3,4,5]
      # board which is an array of "X", "O", " "
      # win_combination which is the nested array inside WIN_COMBINATIONS : example on the first iteration will be [0,1,2]
      # check the board by the given indexes to see if the values are the same and not " "
      win_index_1 = win_combination[0] # win_index_1 value is 0
      win_index_2 = win_combination[1] # win_index_2 value is 1
      win_index_3 = win_combination[2] # win_index_3 value is 2

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == position_2 && position_2 == position_3 && position_1 != " "
        win_combination
      end
    end
  end

  def full?
    @board.all? do |x|
      x == "X" || x == "O"
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    winner = won?
    if winner != nil
      @board[winner[0]]
    end
  end

  def play
    until over?
      turn
    end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
  end
end

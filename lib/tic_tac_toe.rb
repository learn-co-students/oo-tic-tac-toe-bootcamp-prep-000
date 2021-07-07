class TicTacToe
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize
    @board = Array.new(9, " ")
  end

  def board
    @board
  end

  def display_board
    puts " #{board[0]} " "|" " #{board[1]} " "|" " #{board[2]} "
    puts "-----------"
    puts " #{board[3]} " "|" " #{board[4]} " "|" " #{board[5]} "
    puts "-----------"
    puts " #{board[6]} " "|" " #{board[7]} " "|" " #{board[8]} "
  end

  def input_to_index(input)
    user_input = input.to_i
    index = user_input - 1
    return index
  end

  def move(index, character)
    board[index] = character
    return board
  end

  def position_taken?(index)
    (board[index] == " ") || (board[index] == "") || (board[index] == nil)? false : true
  end

  def valid_move?(index)
    (board[index] == " ") && index.between?(0, 8) && !position_taken?(index)? true : false
  end

  def turn_count
      board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
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
    WIN_COMBINATIONS.detect do|win_index|
          (board[win_index[0]] == board[win_index[1]]) && (board[win_index[1]] == board[win_index[2]]) && position_taken?(win_index[0])
    end
  end

  def full?
    board.all? do|index|
      (index == "X" || index == "O" )
    end
  end

  def draw?
     full? && !won?
  end

  def over?
     won? || full? || draw?
  end

  def winner
    if won?
    won_board = won?
    won_board[0]
    board[won_board[0]]
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      our_winner = winner
      if our_winner == "X"
        puts "Congratulations X!"
      else
        puts "Congratulations O!"
      end
    end

    if draw?
      puts "Cat's Game!"
    end
  end
end

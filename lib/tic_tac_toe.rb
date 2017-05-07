class TicTacToe
  def initialize(board = nil)
    @board = Array.new(9) { " " } || board
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

  def current_player
    @current_player = (turn_count % 2 == 0) ? "X" : "O"
  end

  def turn_count
    turns = 0
    @board.each do |position|
      if ((position == "X") || (position == "O"))
        turns += 1
      end
    end
    turns
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player = "X")
    @board[index] = current_player
  end


  def position_taken?(position)
    @board[position] != " " && @board[position] != ""
  end

  def valid_move?(position)
    position.between?(0,8) && !position_taken?(position)
  end

  def turn
    puts "Please enter 1-9:"
    @input = gets.strip
    @index = input_to_index(@input)
    if valid_move?(@index)
      move(@index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if ((position_1 == position_2) && (position_2 == position_3) && ((position_1 == "X") || (position_1 == "O")))
        return win_combination
      end
    end
    false
  end

  def full?
    @board.none? { |position| (position == " ") || (position == "") }
  end

  def draw?
    winner = won?
    full? && !winner
  end

  def over?
    draw? || won?
  end

  def winner
    if (won?)
      winning_token_position = won?[0]
      winning_token = @board[winning_token_position]
    elsif (draw?)
      nil
    end
  end

  def play
    display_board
    until (over?)
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end

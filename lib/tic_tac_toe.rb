class TicTacToe
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  def initialize
    @board = Array.new(9," ")
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
    @board[index] = "#{player}"
  end

  def position_taken?(index)
    @board[index.to_i] == "X" || @board[index.to_i] == "O"
  end

  def valid_move?(index)
    !position_taken?(index) && index <= 8 && index >= 0
  end

  def turn_count
    turn_counter = 0
    @board.each do |square|
      if square == "X" || square == "O"
        turn_counter += 1
        end
      end
    turn_counter
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    player = current_player
    if valid_move?(index)
      move(index, player)
      display_board
    else
      turn
    end
  end

  def won?
    winning_array = []
    position = []
    winner_winner = false
    WIN_COMBINATIONS.each do |win_combination|
      position[0] = @board[win_combination[0]]
      position[1] = @board[win_combination[1]]
      position[2] = @board[win_combination[2]]
      all_x = position.all? do |value|
        value == "X"
      end
      all_o = position.all? do |value|
        value == "O"
      end
      if all_x == true || all_o == true
        winning_array = win_combination
        winner_winner = true
      end
    end
    if winner_winner == true
      winning_array
    else
      false
    end
  end

  def full?
    @board.all? do |space|
    !(space.nil? || space == " ")
    end
  end

  def draw?
    full? == true && won? == false
  end

  def over?
  won? || draw?
  end

  def winner
    winning_combination = won?
    if winning_combination == false
      nil
    else
      @board[winning_combination[0]]
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

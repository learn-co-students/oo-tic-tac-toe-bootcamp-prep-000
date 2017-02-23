class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], # top row
    [3, 4, 5], # mid row
    [6, 7, 8], # bot row
    [0, 3, 6], # left col
    [1, 4, 7], # mid col
    [2, 5, 8], # right col
    [0, 4, 8], # diag
    [2, 4, 6] # anti-diag
  ]

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?( index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn()
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player())
      display_board()
    else
      turn()
    end
  end

  def turn_count()
    @board.count {|token| token == "X" || token == "O"}
  end

  
  def won?()
    WIN_COMBINATIONS.each do |combo|
      pos_1 = @board[combo[0]]
      pos_2 = @board[combo[1]]
      pos_3 = @board[combo[2]]

      if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
        return combo
      elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
        return combo
      end
    end
    return false
  end

  def full?()
    @board.all? { |space| !(space.nil? || space == " ")}
  end

  def draw?()
    !won? && full?
  end

  def over?()
    won? || draw? || full?
  end

  def winner()
    won? ? @board[won?[0]] : nil
  end

  def play()
    while !over?
      turn()
    end

    if won?
      game_winner = winner
      puts "Congratulations #{game_winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def current_player()
    turn_count % 2 == 0 ? "X" : "O"
  end

  
  
end
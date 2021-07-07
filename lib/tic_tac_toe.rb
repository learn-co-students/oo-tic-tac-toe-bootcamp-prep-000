class TicTacToe
  def initialize(board = nil)
    @board = Array.new(9, " ")
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

  def input_to_index(input)
    user_index = input.to_i
    index_of_user = user_index - 1
  end

  def move(index, var)
    @board[index] = var.to_s
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == ""
      return false
    elsif @board[index] == nil
      return false
    else
      return true
    end
  end

  def valid_move?(index)
    if index.between?(0, 8)
      if @board[index] == " " || @board[index] == "" || @board[index] == nil
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def turn_count
    count = 0
    @board.each do |letter|
      if letter == "X" || letter == "O"
        count += 1
      else
        count += 0
      end
    end
    return count
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.to_i
    user_index = input_to_index(user_input)
    if user_index.between?(0, 8)
      if valid_move?(user_index)
        @board[user_index] = current_player
        display_board
      else
        puts "Sorry, that spot is taken!"
        turn
      end
    else
      puts "That is not a valid choice. Please try again:"
      turn
    end
  end

  def valid_move?(index)
    if index.between?(0, 8)
      if @board[index] == " " || @board[index] == "" || @board[index] == nil
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def won?
    board_test = @board.all?{|letter| letter == "" or letter == " "}
    if board_test
      return false
    else
      WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return win_combination
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination
        end
      end
      return false
    end
  end

  def full?
    full_board = 0
    @board.each do |letter|
      if letter == "X" || letter == "O"
        full_board += 1
      else
        full_board += 0
      end
    end
    if full_board == 9
      return true
    else
      return false
    end
  end

  def draw?
    if full?
      if !won?
        return true
      end
    else
      return false
    end
  end

  def over?
    if won? || draw?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      board_index = won?[0]
      if @board[board_index] == "X"
        return "X"
      else
        return "O"
      end
    end
  end

  def play
    until over? || full?
      turn
    end

    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
  end

end

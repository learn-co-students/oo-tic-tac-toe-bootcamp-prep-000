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

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i
    index = index - 1
  end

  def move(index, character = "X")
    @board[index] = character
    return @board
  end

  def position_taken?(index)
    if @board[index] == " "
      return false
    elsif @board[index] == ""
      return false
    elsif @board[index] == nil
      return false
    elsif @board[index] == "X" || @board[index] == "O"
      return true
    end
  end

  def valid_move?(index)
    if index.between?(0, 8) && position_taken?(index) == false
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets
    index = input_to_index(input)
    if valid_move?(index) == true && current_player == "X"
      move(index, "X")
      display_board
    elsif valid_move?(index) == true && current_player == "O"
      move(index, "O")
      display_board
    else
      puts("Please enter a valid number")
      turn
    end
  end

  def turn_count
    turn_number = 0
    @board.each do |space|
      if space == "X"
        turn_number += 1
      elsif space == "O"
        turn_number += 1
      end
    end
    return turn_number
    end

    def current_player
      if turn_count % 2 == 0
        return "X"
      elsif turn_count % 2 != 0
        return "O"
      end
    end

    def won?
      WIN_COMBINATIONS.each do |wc|
        win_index_1 = wc[0]
        win_index_2 = wc[1]
        win_index_3 = wc[2]

        position_1 = @board[win_index_1] # load the value of the board at win_index_1
        position_2 = @board[win_index_2] # load the value of the board at win_index_2
        position_3 = @board[win_index_3] # load the value of the board at win_index_3

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return wc # return the wc indexes that won.
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return wc
        end
      end
      return false
    end

    def full?
      @board.none? {|space| space == " "}
    end

    def draw?
      if won? == false && full? == true
        return true
      else
        return false
      end
    end

    def over?
      if draw? == true
        return true
      elsif won? != false
        return true
      else
        return false
      end
    end

    def winner
      WIN_COMBINATIONS.each do |wc|
        win_index_1 = wc[0]
        win_index_2 = wc[1]
        win_index_3 = wc[2]

        position_1 = @board[win_index_1] # load the value of the board at win_index_1
        position_2 = @board[win_index_2] # load the value of the board at win_index_2
        position_3 = @board[win_index_3] # load the value of the board at win_index_3

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return "X"
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return "O"
        end
      end
      return nil
    end

    def play
      until over? == true
      turn
      end

      if draw? == true
        puts("Cat's Game!")
      elsif winner == "X"
        puts("Congratulations X!")
      elsif winner == "O"
        puts("Congratulations O!")
      end
    end
end

class TicTacToe
  def initialize
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

  def input_to_index(string)
  string.to_i - 1
  end

  def move(index, token = "X")
      @board[index] = token
      @board
    end

    def position_taken?(index)
      if @board[index] == ' ' || @board[index] == '' || @board[index] == nil
        false
      else
        true
      end
    end

    def valid_move?(index)
    # re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
      if !position_taken?(index)  && index.between?(0, 8)
        true
      else
        false
      end
    end

    def turn
      puts "Please enter 1-9:"

      input = gets.strip

      until valid_move?(input_to_index(input))
        puts "Please enter 1-9:"
        input = gets.strip
      end
    index = input.to_i - 1


      move(index, current_player)

      display_board

    end

    def turn_count
      count = 0
      @board.each do |position|
        if position == "X" || position == "O"
          count += 1
        end
      end
      return count
    end

    def current_player
      return turn_count % 2 == 0 ? "X" : "O"
    end

    def won?
      WIN_COMBINATIONS.each do |win_array|
        win_x = win_array.select do |win_sequence|
          @board[win_sequence] == "X"
        end
        win_o = win_array.select do |win_sequence|
          @board[win_sequence] == "O"
        end
        if win_x.length == 3
          return win_x
        elsif win_o.length == 3
          return win_o
        end
      end
      state = true
      @board.each do |position|
        if position != " "
          state = false
        end
      end
      if state == true
        return false
      end
    end

    def full?
      @board.none? do |position|
        position == " "
      end
    end

    def draw?
      # if won?(board)
      #   return false
      # elsif full?(board) &&
      #   return true
      # else
      #   return false
      # end
      !won? && full?
    end

    def over?
      #if won?(board)
      #  return true
      #elsif draw?(board)
      #  return true
      #else
      #  return false
      #end

      won? || draw?
    end

    def winner
      if won?
        state = won?
      else
        state = [9]
      end
      if @board[state[0]] == "X"
         "X"
      elsif @board[state[0]] == "O"
         "O"
      else
         return nil
      end
    end
    #board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]

    def play
      until over?
        turn

      end
      if won?
        puts "Congratulations #{winner}!"
      end
      if draw?
        puts "Cat's Game!"
      end
    end
end

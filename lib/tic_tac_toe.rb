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

    def input_to_index(location)
      location.to_i - 1
    end

    def move(location, token="X")
      @index = input_to_index(location)
      @board[@index] = token
    end

    def position_taken?(location)
      # @index = input_to_index(location) # this line isn't currently used
      # return !(@board[@index].nil? || @board[@index] == " ")
      # return (@board[@index] == "X" || @board[@index] == "Y")
      # return (@board[location] == "X" || @board[location] == "Y")
      return !(@board[location.to_i].nil? || @board[location.to_i] == " ") # unclear why this passes when taking location, rather than @index, in []
    end

    def valid_move?(position)
      return (!position_taken?(input_to_index(position)) && input_to_index(position).between?(0,8))
    end

    def turn
      puts "Please enter 1-9:"
      @input = gets.strip
      @index = @input.to_i
      if valid_move?(@index)
        move(@index, current_player)
      else
        turn
      end
      display_board
    end

    def turn_count
      @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end

    def won?
      WIN_COMBINATIONS.each do |win_combination|
        if win_combination.all?{|space | @board[space] == "X"} ||
           win_combination.all?{|space | @board[space] == "O"}
          return [win_combination[0], win_combination[1], win_combination[2]]
        else
          false
        end
      end
      return false
    end

    def full?
      return @board.all?{|element| element == "X" || element == "O"}
    end

    def draw?
      return !won? && full?
    end

    def over?
      return won? || draw?
    end

    def winner
      if won?
        return @board[won?[0]]
      end
    end

    def play
      until over?
        turn
      end

      if winner
        puts ("Congratulations #{winner}!")
      elsif draw?
        puts ("Cats Game!")
      end
    end

end

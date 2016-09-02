class TicTacToe
  def initialize(board = nil)
      @board = board || Array.new(9, " ")
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

    WIN_COMBINATIONS = [
      [0,1,2], #top row
      [3,4,5], #middle row
      [6,7,8], #bottom row
      [0,3,6], #first column
      [1,4,7], #second column
      [2,5,8], #third column
      [0,4,8], #Diagonal top left to right bottom
      [6,4,2], #Diagonal bottom left to right top
    ]

    def move(index, token = "X")
      @board[index.to_i - 1] = token
    end

    def position_taken?(index)
      !(@board[index.to_i].nil? || @board[index.to_i] == " ")
    end

    def valid_move?(index)
      index = index.to_i
      if index < 9 && index > 0 && position_taken?(index.to_i - 1) == false
        return true
      else
        return nil
      end
    end

    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      if valid_move?(input)
        move(input, current_player)
        display_board
      else
        turn
      end
    end

    def turn_count
     counter = 0
     @board.each do |token|
       if token == "X" || token == "O"
         counter += 1
       end
     end
     return counter
    end

    def won?
      WIN_COMBINATIONS.detect do |combo|
        @board[combo[0]] == @board[combo[1]] &&
        @board[combo[1]] == @board[combo[2]] &&
        position_taken?(combo[0])
      end
    end

    def full?
      @board.all? do |element|
        element == "X" || element == "O"
      end
    end

    def draw?
      !won? && full?
    end

    def over?
      won? || draw?
    end

    def winner
      if won?
        return @board[won?[0]]
      else
        return nil
      end
    end

    def play
      while !over?
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cats Game!"
      end
    end



end

class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
    [0,1,2], # Top Row
    [3,4,5], # Horiz Middle Row
    [6,7,8], # Bottom Row
    [0,3,6], # Left Row
    [1,4,7], # Vert Middle Row
    [2,5,8], # Right Row
    [0,4,8], # Top Left Bottom Right Diagonal
    [6,4,2]  # Bottom Left Top Right Diagonal
    ]
    def display_board
      puts "{ #{@board[0]} | #{@board[1]} | #{@board[2]} }"
      puts "-------------"
      puts "{ #{@board[3]} | #{@board[4]} | #{@board[5]} }"
      puts "-------------"
      puts "{ #{@board[6]} | #{@board[7]} | #{@board[8]} }"
    end
    def input_to_index(input)
      @index = input.to_i - 1
    end
    def move(index, current_player)
      if valid_move?(index)
        @board[index] = "#{current_player}"
      else
        turn
      end
      display_board
    end
    def position_taken?(index)
     return !(@board[index] == nil || @board[index] == " ")
    end
    def valid_move?(index)
      return !position_taken?(index) && index.between?(0,8)
    end
    def turn_count
     @board.count{|position| position == "X" || position == "O"}
    end
    def current_player
      if turn_count % 2 == 0
        @current_player = "X"
      else 
        @current_player = "O"
      end
    end
    def turn
      puts "Select a Number Between 1 and 9:"
      input = gets.strip
      index = input_to_index(input)
      player = current_player
      move(index, player)
    end
    def won?
      WIN_COMBINATIONS.each do |win_combination|
        if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
          return win_combination
        elsif @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
          return win_combination
        end
     end
    nil
    end
    def full?
      return @board.all?{|position| position == "X" || position == "O"}
    end
    def draw?
      return !won? && full?
    end
    def over?
      return draw? || won?
    end
    def winner
      if won?
        return @board[won?[0]]
      end
    end
    def play
      if !over?
        turn
        play
      elsif won?
        puts "Congratulations #{winner}!"
      elsif draw? 
        puts "Cat's Game!"
      end
    end
end
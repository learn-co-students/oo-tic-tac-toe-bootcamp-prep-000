class TicTacToe
      def initialize(board = nil)
        @board = board || Array.new(9," ")
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
      
     
      
    #helper_method  
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    
    #helper_method
    def input_to_index(user_input)
      user_input.to_i - 1
    end
    
    #helper_method
    def move(index, current_player)
      @board[index] = current_player
    end
    
    #helper_method
    def position_taken?(location)
      @board[location] != " " && @board[location] != ""
    end
    
    #helper_method
    def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
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
    
    
    def turn_count
      turns = 0 
        @board.each do |element|
          if element != " "
            turns += 1
        end 
      end 
      turns 
    end 
    
    
    #helper_method
    def current_player
      if turn_count.even? 
        return "X"
      end 
      return "O"
    end 
    
    #helper_method
    def won?
      WIN_COMBINATIONS.detect do |win_array|
          @board[win_array[0]] == @board[win_array[1]] && @board[win_array[1]] == @board[win_array[2]] && position_taken?(win_array[0])
        end 
    end 
    
    #helper_method
    def full?
      @board.all? {|element| element == "X" || element == "O" } 
    end 
    
    #helper_method
    def draw?
      full? && !won?
    end 
    
    def over?
      if won? || draw? || full?
        return true 
      end 
    end 
    
    def winner
      WIN_COMBINATIONS.each do |win_array|
        if win_array.all? {|index| @board[index] == "X"}
          return "X"
        elsif win_array.all? {|index| @board[index] == "O"}
          return "O"
        end 
      end 
       nil  
    end
    
    def play
      until over?
        turn
      end 
       won? ? puts("Congratulations #{winner}!") : puts("Cat's Game!")
    end 
end
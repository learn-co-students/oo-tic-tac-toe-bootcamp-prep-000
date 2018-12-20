class TicTacToe

    def initialize(board = Array.new(9, " "))
        @board = board
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
    
    def input_to_index(input)
        input.to_i-1 #convert user input to integer and subtract 1 to represent index
    end 
    
    def move(index, token)
        @board[index] = token 
    end
    
    def position_taken?(index)
        @board[index] == "X" || @board[index] == "O"
    end
    
    def valid_move?(index)
        !position_taken?(index) && index.between?(0, 8)
    end
    
    def turn_count
        @board.count {|x| x == "X" || x == "O" }
    end
    
    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end
    
    def turn
        puts "Please enter the space number for your move."
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.detect do |combo| # returns first combo for which the code is not false
            @board[combo[0]] == @board[combo[1]] &&
            @board[combo[1]] == @board[combo[2]] &&
            position_taken?(combo[0]) #assures equalness was not due to all combo indices being empty, ie without values
        end
    end
    
    def full?
        @board.all? { |token| token == "X" || token == "O"}
    end
    
    def draw?
        full? && !won?
    end
    
    def over?
        won? || full?
    end
    
    def winner
        if combo = won?
        @board[combo.first]
        end
    end
        
    def play
        until over? || draw?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        else draw?
            puts "Cat's Game!"
        end
    end
end

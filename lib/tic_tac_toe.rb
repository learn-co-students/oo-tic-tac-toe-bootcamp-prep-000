class TTT
    def initialize
        @board = Array.new(9, " ")
        @turn_count = 0
        @empty = 9
        @turn_count = 0
        @game_playing = true
    end 

    def token 
        @turn_count % 2 == 0 ? "x" : "O"
    end 

    def get_input 
        puts "Please enter a number from 1 through 9"
        input = gets.strip.chomp.to_i
        if input < 1 or input > 9
            puts "You must enter a number from 1 though 9!"
            get_input 
        end 
        return input
    end 

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        return index = input - 1
    end 

    def move(index)
        @board[index] = token 
    end    

    def valid(index)
        if @board[index] == " "
            return true 
        else
            return false 
        end 
    end 

    def take_turn 
        index = input_to_index(get_input)
        if valid(index)
            move(index)
        else 
            puts "The slot is already taken!!! Try again"
            take_turn
        end
    end

	def check_game(gameBoard) 
        if  (gameBoard[0] == gameBoard[1] and gameBoard[1] == gameBoard[2] and gameBoard[2] == token) or 
	    (gameBoard[3] == gameBoard[4] and gameBoard[4] == gameBoard[5] and gameBoard[5] == token) or
            (gameBoard[6] == gameBoard[7] and gameBoard[7] == gameBoard[8] and gameBoard[8] == token) or 
            (gameBoard[0] == gameBoard[4] and gameBoard[4] == gameBoard[8] and gameBoard[8] == token) or 
            (gameBoard[2] == gameBoard[4] and gameBoard[4] == gameBoard[6] and gameBoard[6] == token)
            @game_playing = false 
            puts "Game is Over, #{token} wins!"

        elsif  @empty == 0 
            puts "It's a tie!"
            @game_playing = false
        end  
    end
 
    def start 
        puts "Welcome to Tic-Tac_Toe!"
        display_board
        while @game_playing
	    puts "its #{token}'s turn" 
            take_turn
            @empty -= 1
            display_board
            check_game(@board)
            @turn_count += 1 
        end
    end 

    def check_game(gameBoard) 
        if (gameBoard[0] == gameBoard[1] and gameBoard[1] == gameBoard[2] and gameBoard[2] == token) or (gameBoard[3] == gameBoard[4] and gameBoard[4] == gameBoard[5] and gameBoard[5] == token) or(gameBoard[6] == gameBoard[7] and gameBoard[7] == gameBoard[8] and gameBoard[8] == token) or (gameBoard[0] == gameBoard[4] and gameBoard[4] == gameBoard[8] and gameBoard[8] == token) or (gameBoard[2] == gameBoard[4] and gameBoard[4] == gameBoard[6] and gameBoard[6] == token)
            @game_playing = false 
            puts "Game is Over, #{token} wins!"
        elsif  @empty == 0 
            puts "It's a tie!"
            @game_playing = false
        end  
    end 
end 


new_game = TTT.new 
new_game.start 
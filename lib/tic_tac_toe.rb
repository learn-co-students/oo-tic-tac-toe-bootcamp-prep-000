puts "Welcome to Tic Tac Toe!"

class TicTacToe
    def initialize(board = Array.new(9, " "))
        @board = board
    end

    def board=(board)
        @board
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index (user_input)
        (user_input.to_i - 1)
    end


    def move (index, character = "X")
        @board[index] = character
    end

    def valid_move? (index)
        if ((position_taken?(index)) == false) && (index >= 0 && index <= 8)
            return true
            elsif (position_taken?(index)) == true
            return false
            elsif index > 8 || index < 0
            return false
        end
    end

    def position_taken? (index)
        if @board[index] == " " || @board[index] == "" || @board[index] == nil
            return false
        elsif @board[index] == "X" || @board[index] == "O"
            return true
        end
    end

    def turn
        puts "Please enter 1-9:"
        input_user = gets.strip
        index = input_to_index(input_user)
        if current_player == "X"
            character = "X"
            elsif current_player == "O"
            character = "O"
        end
        if valid_move?(index)
            move(index, character)
            else
            puts "Please enter 1-9:"
            input_user = gets.strip
            index = input_to_index(input_user)
            if current_player == "X"
                character = "X"
                elsif current_player == "O"
                character = "O"
            end
        end
        display_board
    end

    def turn_count
        count = 0
        @board.each do |index|
            count += 1 if index == "X" || index == "O"
            #binding.pry
        end
        count
    end

    def current_player
        turn_number = turn_count
        if turn_number.odd? == false
            return "X"
            else
            return "O"
        end
    end

    def play
        until over?
            turn
        end
        if winner == "X"
            puts "Congratulations X!"
            elsif winner == "O"
            puts "Congratulations O!"
            elsif draw?
            puts "Cat's Game!"
        end
    end

    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [0,4,8],
    [2,4,6],
    [2,5,8]
    ]

    def won?
        WIN_COMBINATIONS.each do |combination|
            win_index_1 = combination[0]
            win_index_2 = combination[1]
            win_index_3 = combination[2]

            position_1 = @board[win_index_1]
            position_2 = @board[win_index_2]
            position_3 = @board[win_index_3]

            if position_1 == "X" && position_2 == "X" && position_3 == "X"
                return combination
                elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
                return combination
                else
                false
            end
        end
        false
    end

    def full?
        @board.all? {|element| element == "O" || element == "X"}
    end

    def draw?
        if !won? && full?
            return true
            else
            false
        end
    end

    def over?
        if won? || draw? || full?
            true
            else
            false
        end
    end

    def winner
        if won?
            #binding.pry
            letter = won?
            if @board[letter[0]] == "X"
                return "X"
                elsif @board[letter[0]] == "O"
                return "O"
                else
                return "nil"
                #binding.pry
            end
        end
    end


end

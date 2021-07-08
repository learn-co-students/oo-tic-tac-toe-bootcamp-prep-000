class TicTacToe
    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end

    WIN_COMBINATIONS = [
        [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]
    ]

    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        user_input.to_i - 1
    end

    def move(position, player)
        @board[position] = player
    end

    def position_taken?(position)
        @board[position] == "X" || @board[position] == "O"
    end

    def valid_move?(position)
        position.between?(0,8) && !position_taken?(position)
    end

    def turn_count
        count = 0
        @board.each do |char|
            if (char == "X" || char == 'O')
                count += 1
            end
        end
        count
    end

    def current_player
        (turn_count % 2 == 0)? "X" : "O"
    end

    def turn
        puts "Select a position between 1-9"
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
        x_winner = winning_combination(positions('X'))
        o_winner = winning_combination(positions('O'))
        (x_winner)? x_winner : (o_winner)? o_winner : nil
    end

    def full?
        full_board?
    end

    def draw?
        full? && !won?
    end

    def over?
        draw? || won?
    end

    def winner
        x_winner = winning_combination(positions('X'))
        o_winner = winning_combination(positions('O'))
        (x_winner)? 'X' : (o_winner)? 'O' : nil
    end

    def play
        until over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"    
        end
    end




    # helper methods
    def full_board?
        @board.all? do |char|
            char == 'X' || char == 'O'
        end
    end

    def positions(char)
        positions = []
        @board.each_with_index do |val, index|
            if val == char
                positions.push(index)
            end
        end
        positions
    end

    def winning_combination(positions)
        i = 0
        while i < WIN_COMBINATIONS.length
            combination = WIN_COMBINATIONS[i]
            match = combination.all? do |val|
                positions.include?(val)
            end
            if(match)
                return combination
            end
            i += 1
        end
    end


end

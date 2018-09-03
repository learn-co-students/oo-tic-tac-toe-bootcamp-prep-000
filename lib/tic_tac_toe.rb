class TicTacToe
    WIN_COMBINATIONS = [[0, 1, 2],
                        [3, 4, 5],
                        [6, 7, 8],
                        [0, 3, 6],
                        [1, 4, 7],
                        [2, 5, 8],
                        [0, 4, 8],
                        [6, 4, 2] ]
    def initialize
        @board = Array.new(9," ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        user_input = user_input.to_i - 1
    end

    def move(int,char)
        @board[int] = char
    end

    def position_taken?(index)
        return true if @board[index] == 'X' ||  @board[index] == 'O'
        return false
    end

    def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
    end

    def turn_count
        count = 0
        @board.each do |x|
            if x == 'X' || x == 'O'
                count += 1
            end
        end
        count
    end

    def current_player
        turn = turn_count
        if turn % 2 == 0
            return 'X'
        else
            return 'O'
        end
    end

    def turn
        puts "Please choose a number 1-9:"
        user_input = gets.chomp
        index = input_to_index(user_input)
        if valid_move?(index)
            player  = current_player
            move(index, player)
            display_board
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.each do |x|
            index_0 = x[0]
            index_1 = x[1]
            index_2 = x[2]

            pos_1 = @board[index_0]
            pos_2 = @board[index_1]
            pos_3 = @board[index_2]

            if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
                return x
            elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
                return x
            end
        end
        return false
    end
    def full?
        @board.all? {|index| index == "X" || index == "O"}
    end
    def draw?
      if !won? && full?
        return true
      else
        return false
      end
    end
    def over?
      if won? || draw?
        return true
      else
        return false
      end
    end
    def winner
        index = []
        index = won?
        if index == false
            return nil
        else
            if @board[index[0]] == 'X'
                return 'X'
            else
                return 'O'
            end
        end
    end
    def play
        until over? == true
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end
end

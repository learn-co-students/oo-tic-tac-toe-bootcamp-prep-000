class TicTacToe

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

    def initialize(board=get_new_board)
        @board = board
    end


    def get_new_board
        return [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def move(pos, p='X')
        idx = pos.to_i-1
        if valid_move?(pos)
            @board[idx] = p
            return true
        else
            puts "Invalid move"
            return false
        end
    end

    def position_taken?(idx)
      !(@board[idx].nil? || @board[idx] == " ")
    end

    def valid_move?(pos)
        idx = pos.to_i-1
        answ = position_taken?(idx)
        if answ == nil || answ == true || idx < 0 || idx > 8
            return false
        else
            return true
        end
    end

    def turn
        while true
            puts "Please enter your move as a position [1-9]"
            pos = gets
            if move(pos, current_player) == false
                puts "Invalid move :("
                next
            else
                display_board
                break
            end
        end
    end

    def won?
        WIN_COMBINATIONS.each do |c|
            if @board[c[0]] == " "
                next
            elsif @board[c[0]] == @board[c[1]] && @board[c[0]] == @board[c[2]]
                return c
            end
        end
        #no winning c was found
        return false
    end

    def full?
        if @board.include?(" ")
            return false
        end
        return true
    end

    def draw?
        if won?
            return false
        end
        if full?
            return true
        end
        return false
    end

    def over?
        if full?|| draw? || won?
            return true
        else
            return false
        end
    end

    def winner
        winner = won? ? @board[won?[0]] : nil
        return winner
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_idx(i)
        return i.to_i - 1
    end

    def turn_count
        return (9 - @board.count(" "))
    end

    def current_player
        p = turn_count%2 == 0 ? 'X' : 'O'
        return p
    end

    def play
        while !over?
            turn
        end
        if draw?
            puts "Cats Game!"
        else
            puts "Congratulations #{winner}!"
        end
    end

end
#------------------

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
    
    def play
        def display_board
            puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
            puts "-----------"
            puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
            puts "-----------"
            puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
        end
        while !over
            def turn
                def turn_count
                end
                def move
                end
                def current_player
                end
                puts "Please enter 1-9:"
                def input_to_index(input)
                end
                def valid_move?
                end

                def position_taken?
                end
                
                def won?
                end
                
                def draw?
                end
                
                def winner
                end
            end
        end
    end
end

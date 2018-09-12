class TicTacToe
    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    WIN_COMBINATIONS =[
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
        input.to_i - 1
    end

    def move(index,char)
        @board[index] = char
        @board
    end

    def position_taken?(index)
        @board[index] != ' '
    end
    
    def valid_move?(index)
        !position_taken?(index) && index >= 0 && index <= 8
    end
    
    def turn_count
        i = 0
    
        @board.each do |cell|
            if cell != " " && cell != ""
                i += 1
            end
        end
    
        return i
    end
    
    def current_player
    
        if turn_count % 2 == 0
            return 'X'
        else return 'O'
    
        end
    end
    
    def board_empty?
        @board.all? do |cell|
          cell.nil? || cell == ' '
        end
      end
      
    def full?
        @board.none? do |cell|
          cell.nil? || cell == ' '
        end
    end
      
    def winning_combination
        WIN_COMBINATIONS.find do |win_combination|
          win?(win_combination)
        end
    end
      
    def draw?
        won?
        full? && winning_combination.nil?
    end
      
    def win?(win_combination)
        return false if @board[win_combination[0]] == " "
      
        @board[win_combination[0]] == @board[win_combination[1]] && 
        @board[win_combination[1]] == @board[win_combination[2]]
    end
      
    def won?
        return false if board_empty?
      
        winning_combination
    end
      
    def over?
        won? || draw?
    end
      
    def winner
        @board[winning_combination[0]] if won? 
    end
    
    def turn
        char = current_player
        valid_move = false
    
        while !valid_move
            puts "Please enter 1-9:"
            input = gets.strip
            index = input_to_index(input)
        
            valid_move = valid_move?(index)
        end
        
        move(index, char)
    
        display_board
    end
    
    def play
        until over?
            turn
        end
    
        puts "Cat's Game!" if draw?
    
        puts "Congratulations #{winner}!" if winning_combination
    
    end
end



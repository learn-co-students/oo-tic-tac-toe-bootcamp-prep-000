class TicTacToe

    def initialize (board=nil)
        @board= board || Array.new(9, " ")
        
    end
    
    WIN_COMBINATIONS= [ 
        [0,1,2], #top row
        [3,4,5], #mid row
        [6,7,8], #low row
        [0,3,6], #L colum
        [1,4,7], #mid colum
        [2,5,8], # R colum
        [2,4,6], #dig one
        [0,4,8] #dig tow
      ]

      def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      end

      def input_to_index(user_input)
        
        index=user_input.to_i-1
        
      end

      def move(board_index, character="X")

        @board[board_index]=character
        
      end

      def position_taken?(index)
        if !(@board[index].nil? || @board[index] == " ")
        true
        else 
            false
        end
      end

      def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
      end

      def turn_count
        counter=0
        @board.each do |element|
            if element=="X" || element== "O"
                counter+=1
            end
        end
        counter
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
      end
      




      def won?
        WIN_COMBINATIONS. each do |combination|
      
          if @board[combination[0]]=="X" && @board[combination[1]]=="X" && @board[combination[2]]=="X" || @board[combination[0]]=="O" && @board[combination[1]]=="O" && @board[combination[2]]=="O"
            return combination 
          end 
        end
        return false 
      end 

      def full?
        @board.all? do |positions|
          positions !=" "
        end
      end

      def draw?

        if full? && !won?
          true 
        else 
          false
        end
    end


    def over?
        won? || draw? || full?
      
       end

       def winner
        if won? == false 
          nil
        else WIN_COMBINATIONS. each do |combination|
      
          if @board[combination[0]]=="X" && @board[combination[1]]=="X" && @board[combination[2]]=="X" 
            return "X"
            
          elsif @board[combination[0]]=="O" && @board[combination[1]]=="O" && @board[combination[2]]=="O"
            return "O"
          end
        end
      end
    end


    def turn
        puts "Please enter 1-9:"
        user_input=gets.strip
        index=input_to_index(user_input)
        if valid_move?(index)
            character=current_player
            move(index, character)
            
        else
            turn
        end
        display_board

    end
      
    def play

        while !over?
           
            turn
            
        end

        if won?
            puts "Congratulations #{winner}!"
        else draw?
            puts "Cat's Game!"
        end
          
      end


end
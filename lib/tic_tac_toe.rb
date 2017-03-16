class TicTacToe
    def initialize(board = nil)
      @board = board || Array.new(9, " ")
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

      def input_to_index(user_input)
        user_input = user_input.to_i
        user_input = user_input - 1
      end

      def move(index, value)
        @board[index] = value
      end

      
      def position_taken?(index)
        if @board[index] == "X" || @board[index] == "O"
           return  true
         elsif @board[index] == "" || @board[index] == nil
            return false
          elsif @board[index] == " "
            return false
          end
      end

      
      def valid_move?(index)
        if position_taken?(index) == true
          return false
        elsif index.between?(0,8)
          return true
        end
      end

      
      def turn
            puts "Please enter 1-9:"
            input = gets.strip
            index = input_to_index(input)
            value = current_player
            if valid_move?(index)  == true
               move(index, value)
               display_board
            else
                turn
            end
       end
       
        
        def turn_count
            counter = 0
            @board.each do |i|
              if i == "X" || i == "O"
              counter += 1
              end
            end
            return counter
        end

        def current_player
           if turn_count % 2 == 0
             return "X"
           else
            return "O"
           end
        end

        def won?

            WIN_COMBINATIONS.each do |win_combination|
            win_index_1 = win_combination[0]
            win_index_2 = win_combination[1]
            win_index_3 = win_combination[2]

             position_1 = @board[win_index_1]
             position_2 = @board[win_index_2]
             position_3 = @board[win_index_3]

                 if position_1 == "X" && position_2 == "X" && position_3 == "X"
                    return win_combination
                  else
                   false
                  end
                  if position_1 == "O" && position_2 == "O" && position_3 == "O"
                     return win_combination
                   else
                    false
                   end
            end
            return nil
        end

        def full?
          @board.all?{|index| index != " "} # "X" or "O"
        end

        def draw?
         !won? && full?
        end

        def over?
          won? || draw?
        end

        def winner
            if win_combination = won?
              @board[win_combination.first]
            end
        end

        def play
           until over?
             turn
           end
           if won?
                game_winner = winner
                puts "Congratulations #{game_winner}!"
           elsif draw?
                puts "Cat's Game!"
           end
        end
    
  end
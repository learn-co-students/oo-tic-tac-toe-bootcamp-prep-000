class TicTacToe

    def initialize 
      @board = [" "," "," "," "," "," "," "," "," "]
    end

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,4,8],
      [2,4,6],
      [0,3,6],
      [1,4,7],
      [2,5,8]
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

    def move(index, player_token)
      @board[index] = player_token
    end

    def position_taken?(index)
      if @board[index] == " " || @board[index] == "" || @board[index] == nil
        false
      else @board[index] == "X" || @board[index] == "O"
        true 
      end
    end

    def valid_move?(index)
      if index.between?(0,8) && !position_taken?(index)
          true
      else 
          false
      end  
    end

    def turn_count
      count = 0
      @board.each do |square|
        if square == "X" || square == "O"
      count += 1
        end
      end
      count
    end

    def current_player
      if turn_count.even? 
          "X" 
      else 
          "O"
      end
    end

    def turn
      puts "Please enter a number 1-9:"
      user_input = gets.chomp
      index = input_to_index(user_input)
      if valid_move?(index)
          player_token = current_player
          move(index, player_token)
          display_board
      else
        turn
      end
    end

    def won?
      WIN_COMBINATIONS.any? do |combo|
        if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
            return combo
            end
        end
    end

    def full?
      if @board.all? {|index| index == "X" || index == "O"}
        true
      end
    end 
    
    def draw?
      if full? && !won?
          true
      elsif won? && !full?
          false
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
      if won?
        @board[won?[0]] == "X" ? "X" : "O"
      else
        nil
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

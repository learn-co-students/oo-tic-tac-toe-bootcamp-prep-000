class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [ #win combos
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,4,8], #L to R diagonal
    [2,4,6], #R to L diagonal
    [0,3,6], #left column
    [1,4,7], #middle column
    [2,5,8] #right column
    ]

    def display_board #displays representations of @board array as tic tac toe board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      puts "-----------"
    end

    def input_to_index(input) #converts input to an integer, -1 for array indeces
      input.to_i - 1
    end

    def move(index, player_token)  #moves a player_token to the @board array
      @board[index] = player_token #store the player_token to @board index
      display_board #displays the board after each move
    end

    def position_taken?(index)
      @board[index] != " " #as long as the index is not equal to " ", return fals, position is NOT taken
    end

    def valid_move?(index) #if the index is in the correct range 0-8, and is not taken
      index.between?(0,8) && !position_taken?(index)
    end

    def turn_count
      counter = 0 #creates a local var counter
      @board.each do |space| #iterate through the board spaces
        if space == "X" || space == "O" #if the index is occupied by either X or O
          counter += 1 #add one to counter
        elsif space == " " #else if blank space add nothing
          counter += 0
        end
      end
        counter #=> counter's value i.e. how many turns have passed
      end

      def current_player
        if turn_count % 2 == 0 #pass the number of turns, and modulo to see if even has remainder.
          "X"
        else #can probably use .odd? or .even? to acheive similar, but this keeps in line with #turn_count
          "O"
        end
      end

      def turn
        puts "Please enter 1-9:"
        input = gets.chomp
        index = input_to_index(input)
        player_token = current_player
        if valid_move?(index)
          move(index, player_token)
        else
          turn
        end
      end

      def won?
        WIN_COMBINATIONS.find do |combination|
          @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X" ||
            @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
          end
        end

        def full?
          !@board.include?(" ")
        end

        def draw?
          full? && !won?
        end

        def over?
          full? && (draw? || won?)
        end

        def winner
          if won?
            @board[won?[0]]
          end
        end

        def play
          until over? || won? || draw?
            turn
          end
          if won?
            puts "Congratulations #{winner}!"
          elsif draw?
            puts "Cat's Game!"
          end
        end



      end

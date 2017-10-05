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
        [0,3,8],
        [6,4,2]
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

    def move(index, player)
      board[position] = player
    end

    def position_taken?(index)
      if board[position] == "X" || board[position] == "O"
         true
      else
         false
      end
    end

    def valid_move?(index)
      if position.between?(0,8) && !position_taken?(board, position)
         true
      else
         false
      end
    end

    def turn
      puts "Please enter 1-9:"
      move = gets.strip

      int = input_to_index(move)

      if valid_move?(board, int)
          move(board, int, current_player(board))
          display_board(board)
      else
          puts "Please enter 1-9:"
          move = gets.strip
          int = input_to_index(move)
      end
    end

    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def won?
      if board.all? { |spot| spot.strip == ""} == false
         false
      end

      if (board[WIN_COMBINATIONS[0][0]] == "X" && board[WIN_COMBINATIONS[0][1]] == "X" && board[WIN_COMBINATIONS[0][2]] == "X") || (board[WIN_COMBINATIONS[0][0]] == "O" && board[WIN_COMBINATIONS[0][1]] == "O" && board[WIN_COMBINATIONS[0][2]] == "O")
         return WIN_COMBINATIONS[0]
      elsif (board[WIN_COMBINATIONS[1][0]] == "X" && board[WIN_COMBINATIONS[1][1]] == "X" && board[WIN_COMBINATIONS[1][2]] == "X") || (board[WIN_COMBINATIONS[1][0]] == "O" && board[WIN_COMBINATIONS[1][1]] == "O" && board[WIN_COMBINATIONS[1][2]] == "O")
         return WIN_COMBINATIONS[1]
      elsif (board[WIN_COMBINATIONS[2][0]] == "X" && board[WIN_COMBINATIONS[2][1]] == "X" && board[WIN_COMBINATIONS[2][2]] == "X") || (board[WIN_COMBINATIONS[2][0]] == "O" && board[WIN_COMBINATIONS[2][1]] == "O" && board[WIN_COMBINATIONS[2][2]] == "O")
         return WIN_COMBINATIONS[2]
      elsif (board[WIN_COMBINATIONS[3][0]] == "X" && board[WIN_COMBINATIONS[3][1]] == "X" && board[WIN_COMBINATIONS[3][2]] == "X") || (board[WIN_COMBINATIONS[3][0]] == "O" && board[WIN_COMBINATIONS[3][1]] == "O" && board[WIN_COMBINATIONS[3][2]] == "O")
         return WIN_COMBINATIONS[3]
      elsif (board[WIN_COMBINATIONS[4][0]] == "X" && board[WIN_COMBINATIONS[4][1]] == "X" && board[WIN_COMBINATIONS[4][2]] == "X") || (board[WIN_COMBINATIONS[4][0]] == "O" && board[WIN_COMBINATIONS[4][1]] == "O" && board[WIN_COMBINATIONS[4][2]] == "O")
         return WIN_COMBINATIONS[4]
      elsif (board[WIN_COMBINATIONS[5][0]] == "X" && board[WIN_COMBINATIONS[5][1]] == "X" && board[WIN_COMBINATIONS[5][2]] == "X") || (board[WIN_COMBINATIONS[5][0]] == "O" && board[WIN_COMBINATIONS[5][1]] == "O" && board[WIN_COMBINATIONS[5][2]] == "O")
         return WIN_COMBINATIONS[5]
      elsif (board[WIN_COMBINATIONS[6][0]] == "X" && board[WIN_COMBINATIONS[6][1]] == "X" && board[WIN_COMBINATIONS[6][2]] == "X") || (board[WIN_COMBINATIONS[6][0]] == "O" && board[WIN_COMBINATIONS[6][1]] == "O" && board[WIN_COMBINATIONS[6][2]] == "O")
         return WIN_COMBINATIONS[6]
      elsif (board[WIN_COMBINATIONS[7][0]] == "X" && board[WIN_COMBINATIONS[7][1]] == "X" && board[WIN_COMBINATIONS[7][2]] == "X") || (board[WIN_COMBINATIONS[7][0]] == "O" && board[WIN_COMBINATIONS[7][1]] == "O" && board[WIN_COMBINATIONS[7][2]] == "O")
         return WIN_COMBINATIONS[7]
      else
         false
      end
    end

    def full?
      if board.all? { |spot| spot.strip != ""} == true
         true
      else
         false
      end
    end

    def draw?
      if full?(board) && !won?(board)
         true
      end
    end

    def over?
      if draw?(board)
         true
      elsif full?(board) && won?(board)
         true
      elsif !full?(board) && won?(board)
         true
      else
         false
      end
    end

    def winner
      if !won?(board) && full?(board)
         return false
      end

      if won?(board)
         win = won?(board)
         if board[win[0]] == "X"
            "X"
         elsif board[win[0]] == "O"
            "O"
         end
      end
    end

    def play
      until over?(board) do
         turn(board)
      end

      if won?(board)
         puts "Congratulations #{winner(board)}!"
      elsif draw?(board)
         puts "Cat's Game!"
      end
    end
end

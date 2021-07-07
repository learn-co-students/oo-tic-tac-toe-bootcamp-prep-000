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

    def input_to_index(input)
      input.to_i - 1
    end

    def move(index, current_player = "X")
      @board[index] = current_player
    end

    def position_taken?(index)
      if @board[index] == "X" || @board[index] == "O"
        true
      else
        false
      end
    end

    def valid_move?(index)
      if !position_taken?(index) && index.between?(0,8)
        true
      else
        false
      end
    end

    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)

      if(valid_move?(index))
        move(index, current_player)
      else
        turn
      end
      display_board
    end

    def turn_count
      counter = 0
      @board.each do |count|
        if count == "X" || count == "O"
          counter += 1
        end
      end
      counter
    end

    def current_player
      turn_count.even? ? "X" : "O"
    end

    def won?
      WIN_COMBINATIONS.each do |sub_array|
        if position_taken?(sub_array[0]) && @board[sub_array[0]] == @board[sub_array[1]] && @board[sub_array[0]] == @board[sub_array[2]]
          return sub_array
        end
      end
      return nil
    end

    def full?
      @board.all?{|fill| (fill == "X" || fill == "O")}
    end

    def draw?
      full? && !won?
    end

    def over?
      won? || draw?
    end

    def winner
      if won?
        @board[won?[0]]
      end
    end

    def play
      until over?
        turn
      end

      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end

end

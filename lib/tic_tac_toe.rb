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
    @index = input.to_i - 1
  end

  def move(index, token="X")
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index] == " " || @board[index].nil?)
    end

    def valid_move?(index)
    ((index < 0 || index > 8) || (position_taken?(index))) ? false : true
    end

    def turn_count
      @board.count{|i| i == "X" || i == "O"}
    end

    def current_player
      (turn_count % 2 == 0) ? "X" : "O"
    end

    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else turn
      end
    end

    def won?
      WIN_COMBINATIONS.select do |win_com|
        if (@board[win_com[0]] == "X" && @board[win_com[1]] == "X" && @board[win_com[2]] == "X")
          return win_com
        elsif (@board[win_com[0]] == "O" && @board[win_com[1]] == "O" && @board[win_com[2]] == "O")
          return win_com
        end
      end
      false
    end

    def full?
      @board.all?{|i| i == "X" || i == "O"}
    end

    def draw?
      (full? && !won?) ? true : false
    end

    def over?
      (draw? || won?) ? true : false
    end

    def winner
      won? ? (return @board[won?[0]]) : nil
    end

    def play
      while over? == false
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end
end

class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

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

  def move(index, token = "X")
    index = input_to_index(index)
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index = input_to_index(index)
    !position_taken?(index) && index.between?(0, 8)
  end

  def turn
    puts "Please enter 1-9:"
    index = gets.strip
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]] &&
      position_taken?(win_combination[0])
    end
  end

    def full?
      @board.all?{ |token| token == "X" || token == "O" }
    end

    def draw?
      !won? && full?
    end

    def over?
      won? || draw?
    end

    def winner
      if winning_player = won?
        @board[winning_player.first]
      end
    end

    def play
      while !over?
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cats Game!"
      end
    end
  end

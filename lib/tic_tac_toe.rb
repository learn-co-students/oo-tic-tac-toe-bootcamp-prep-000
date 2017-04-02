class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn_count
    @board.count{|square| square != " " }
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
     puts "Please enter a number (1-9):"
     user_input = gets.strip
     index = input_to_index(user_input)
     if valid_move?(index)
       token = current_player
       move(index, token)
     else
       turn
     end
     display_board
   end

  def won?
    WIN_COMBINATIONS.any? do |winner|
      if position_taken?(winner[0]) && @board[winner[0]] == @board[winner[1]] && @board[winner[1]] == @board[winner[2]]
        return winner
      end
    end
  end

  def full?
    @board.all? do |move|
      move=="X"||move=="O"
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if combo = won?
      @board[combo[0]]
    end
  end

  def play
    until over?
      turn
    end
    puts winner ? "Congratulations #{winner}!": "Cat's Game!"
    end
  end

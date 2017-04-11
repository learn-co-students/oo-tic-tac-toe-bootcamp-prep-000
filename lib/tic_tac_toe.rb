class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9," ")
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
    puts(" #{@board[0]} | #{@board[1]} | #{@board[2]} ")
    puts("-----------")
    puts(" #{@board[3]} | #{@board[4]} | #{@board[5]} ")
    puts("-----------")
    puts(" #{@board[6]} | #{@board[7]} | #{@board[8]} ")
  end

  def input_to_index(input)
    (input.to_i) -1
  end

  def move(index, player_symbol="X")
    @board[index]=player_symbol
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    index<@board.length && index>=0 && !position_taken?(index)
  end

  def turn
    puts("Enter a number from 1-9:")
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      puts("Invalid move.")
      turn
    end
  end

  def turn_count
    (@board.select { |taken| taken=="X"||taken=="O"  } ).length
  end

  def current_player
    turn_count%2==0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |winning_array|
      if winning_array.all? { |square| @board[square]=="X" } || winning_array.all? { |square| @board[square]=="O"}
        return winning_array
      end
    end
    return false
  end

  def full?
    @board.all? { |square| square=="X"||square=="O" }
  end

  def draw?
    full? && !won?
  end

  def over?
    full? || won?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    while !over?
      turn
      if draw?                  #don't think I need this if statement but needed it to pass test
        break
      end
    end
    draw? ? puts("Cat's Game!") : puts("Congratulations #{winner}!")
  end



end
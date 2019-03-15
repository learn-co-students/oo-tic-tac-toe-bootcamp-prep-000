class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def board=(board)
    @board = board
  end

  def board
    @board
  end

  WIN_COMBINATIONS=[
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
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1  #user_input converted to integer
  end

  def move(index, current_player) # current_player(default X)
    @board[index] = current_player
  end

  def position_taken?(index_i)
    (@board[index_i]=="X") ||(@board[index_i]=="O")
  end

  def valid_move?(index)
    index.between?(0,8)&& !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    user_input=gets.strip
     index=input_to_index(user_input)
     if valid_move?(index)
       token=current_player
       move(index,token)
     else
       turn
     end
     display_board
   end

   def turn_count
     @board.count{|token|token == "X" || token == "O"}
   end

   def current_player
     turn_count % 2 == 0? "X": "O"
   end

   def won?
     WIN_COMBINATIONS.detect do |win_combination|
       if(@board[win_combination[0]])== "X" &&
         (@board[win_combination[1]])== "X" &&
         (@board[win_combination[2]])=="X"
         return win_combination
       elsif(@board[win_combination[0]])== "O" &&
            (@board[win_combination[1]])== "O" &&
            (@board[win_combination[2]])== "O"
            return win_combination
        end
           false
        end
    end

    def full?
      @board.all?{|player|player == "X" || player == "O"}
    end

    def draw?
      !(won?)&&(full?)
    end

    def over?
      won? ||full? ||draw?
    end

    def winner
      if winning_combination=won?
        @board[winning_combination.first]
      end
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

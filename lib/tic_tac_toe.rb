require 'pry'
class TicTacToe
  attr_reader :board
  
  WIN_COMBINATIONS =  [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]
  def initialize
    @board = Array.new(9," ")
  end

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
    @board[index] = token
  end

  def position_taken?(index)
    # if @board[index] == "X" || @board[index] == "O"
    #   true
    # else 
    #   false
    # end

  # if @board[index] != "X"
    #   true
    # else
    #   false
    # end

    @board[index] != " " 
  end

  def valid_move?(index)
     index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    counter = 0
    @board.each do |el|
      if el == "X" || el == "O"
        counter += 1 
      end
      # counter += 1 if el != " "
    end
    counter
  end

  def current_player
    ## if it's an even number on turn count then we return X
    # turn_count % 2 == 0 ? "X" : "O"
    if turn_count % 2 == 0
      "X"
    else 
      "O"
    end
    # turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Choose a number between 1-9"
    index = input_to_index(gets.chomp)
     if valid_move?(index)
        move(index, current_player)
        display_board
     else
      turn
     end
  end

  def won?
    winner = nil

    WIN_COMBINATIONS.each do |combo|
       #this Checks to see if all the indexs are equal to X if so that means this particualr array won.
      if combo.all? {|win| @board[win] == "X" }
        winner = combo
      elsif combo.all? {|win| @board[win] === "O" }
        winner = combo
      else 
      winner
      end
    end
    winner
  end

  def full?
    turn_count == 9
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    # won? ? @board[won?[0]] : nil
    if player = won?
      @board[player[0]]
    end
  end

  def play
    turn until over?
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end



end
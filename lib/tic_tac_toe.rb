class TicTacToe
    def initialize(board = nil)
    @board = board || Array.new(9, " ")
      
        end #board 

  def board
    @board
  end   #board

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end #display_board

  def input_to_index(input)
    input.to_i - 1
  end  

  def valid_move?(input)
    index=input_to_index(input)
    index.between?(0,8) && !position_taken?(index)
  end

  def move(input, current_player)
    index=input_to_index(input)
    board[index] = current_player
  end #move

  def position_taken?(location)
    board[location] != " " && board[location] != ""
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      # move(input)

    display_board
    
    else turn
    end
  end




=begin def draw?
    if won?(board)==true  #the game is won
      false
    # the game is not won
    elsif full?(board)==true  #the board is full
      true
    else                    #the board is not full
      false
    end
  end
=end



  
WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
end #class 
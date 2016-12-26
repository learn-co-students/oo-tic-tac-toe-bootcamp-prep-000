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
      move(input,current_player)

    display_board
    
    else turn
    end
  end #turn

  def turn_count
    no_x=board.select do |x|
    x=="X"
  end
    no_o=board.select do |o|
    o=="O"
  end

    turn=no_x.count+no_o.count
 end #turn_count?

  def current_player
    turn_count.even? ? "X":"O"
  end



  def full?
    board.all? do |board_position|
   !(board_position.nil? || board_position == " " || board_position =="")
  end
  end

  

  def won?
    store=WIN_COMBINATIONS.select do |combination|
      board[combination[0]]=="X" && board[combination[1]]=="X"&& board[combination[2]]=="X" || board[combination[0]]=="O" && board[combination[1]]=="O"&& board[combination[2]]=="O"
    end
    store=store[0]
    
    if store==[] || store== nil
      false
    else  true
    end

  end #won?

  def draw?
    if won? ==true  #the game is won
      false
    # the game is not won
    elsif full? ==true  #the board is full
      true
    else   false                 #the board is not full
    end
  end #draw?

  
  def over?
    if won?
    true
  elsif draw?
    true
    end
  end #over?

  def winner

    no_x=board.select do |x|
    x=="X"
    end

    no_o=board.select do |o|
    o=="O"
    end

    if won? ==false
      nil
    elsif no_x.count > no_o.count
    "X"
    else
    "O"
    end
  end  #winner

  
  def play
      until over? ==true
        display_board
        turn
      end

      if won?
        no_x=board.select do |x|
          x=="X"
        end

        no_o=board.select do |o|
          o=="O"
        end

                if no_x.count>no_o.count
                 winner="X"
               else winner="O"
               end
       puts "Congratulations #{winner}!"

     elsif draw?
       puts "Cats Game!"
     else false
     end #if

     
end #play


WIN_COMBINATIONS=[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]

end #class  
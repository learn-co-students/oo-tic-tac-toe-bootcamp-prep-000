class TicTacToe
  def initialize(board = nil)
    @board= board || Array.new(9, " ")
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

  def display_board(board = @board)
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
      (input.to_i)-1

  end

  def move(index, token="X")
    @board[index]=token
  end

  def position_taken? (index)
    if @board[index] == " " || @board[index] == ""
      false
    elsif @board[index] == nil
      false
    else
      true
    end
  end

  def valid_move?(position)
    if position.between?(0, 8) && !position_taken?(position)
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)

    until valid_move?(index)
    puts "Invalid move, please enter 1-9"
    new_input = gets.strip
    index = input_to_index(new_input)
    end
    move(index,current_player)
    display_board(@board)
  end

  def turn_count
    count = 0
   @board.each do |token|
    if token == "X" || token =="O"
      count+=1
    end
  end
  return count
  end

  def current_player
   count = turn_count
   if count%2==0
     token="X"
   elsif count%2!=0
     token = "O"
   end
   end

   def won?
       WIN_COMBINATIONS.find do |combination_array|
        if combination_array.all? do |index|
             @board[index]=="X"
           end
              true
        elsif combination_array.all? do |index|
                @board[index]=="O"
              end
               true
        else
            false
        end
      end
   end

   def full?
      if @board.any? do |index|
        index == " " || index == "" || index == nil
        end
        return false
      else
        return true
      end
   end


   def draw?
       if won? && full?
         return false
       elsif full?
         return true
       end
   end


   def over?
       if draw? || full? || won?
         return true
       else
         return false
       end
   end

   def winner
       if over?
         winning_array = won?
         current_position = winning_array[0]
         current_winner = @board[current_position]
         return current_winner
       else
         nil
       end
   end

   def play
     until over?
       turn
     end

     if draw?
       puts "Cat's Game!"
     elsif won?
       puts "Congratulations #{winner}!"
     end
   end

end

class TicTacToe

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

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

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

  def move(index, current_player="X")
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter=0
    @board.each do |slot|
      if(slot=='X' || slot=='O')
        counter+=1
      end
    end
    return counter
  end

  def current_player
    turn_count%2==0 ? "X" : "O"
  end

  def won?

    all_empty = @board.all? do |ele|
      ele == " "
    end

    if(all_empty)
      return false
    end

    WIN_COMBINATIONS.each do |array|
      position_1=@board[array[0]]
      position_2=@board[array[1]]
      position_3=@board[array[2]]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return array
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return array
      else
        false
      end
    end

    all_taken = @board.all? do |ele|
      ele == "X" || ele == "O"
    end
    if(all_empty)
      return false
    end
  end

  def full?
    i=0
    while i<@board.size
      if !position_taken?(i)
        return false
      end
      i+=1
    end
    return true
  end

  def draw?
    !won? && full?
  end

  def over?
    if won? || draw? || full?
      return true
    else
      return false
    end
  end

  def winner
   if won?
     return @board[won?[0]]
   end
  end

  def play
    counter=0
    while(counter<9) do

      if !over?
        turn
      elsif draw?
        puts "Cat's Game!"
      elsif won?
        puts "Congratulations #{winner}!"
      end
      counter+=1
    end
  end
end

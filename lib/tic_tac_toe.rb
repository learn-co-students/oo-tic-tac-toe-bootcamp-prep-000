class TicTacToe
    @board

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end



  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2] ]

  def board_empty?
    @board.all? { | position | position.strip.empty? }
  end

  def inprogress?
    @board.any? { | position | position.strip.empty? }
  end

  def won?
    for i in 0..WIN_COMBINATIONS.length-1 do
      combo =  WIN_COMBINATIONS[i]
      one = combo[0]
      two = combo[1]
      three = combo[2]
      if (@board[one]=="X"||@board[one]=="O") &&  @board[one]==@board[two] && @board[two] == @board[three]
        return [one,two,three]
      end
    end
    return false
  end

  def full?
     !inprogress?
  end

  def draw?
     if won?
       return false
     elsif full?
       return true
     end
  end

  def over?
  	if won?
  		puts "Congratulations #{winner}!"
      return true
  		exit
  	elsif draw?
  	  puts "Cat's Game!"
  		return true
    else  !(inprogress?)
  	end
  end

  def winner
    if won?
      @board[won?[0]]
    else
      nil
    end
  end

  # def display_board
      # print " #{@board[0]} | #{@board[1]} | #{@board[2]} \n"
      # print  "-----------\n"
      # print " #{@board[3]} | #{@board[4]} | #{@board[5]} \n"
      # print "-----------\n"
      # print " #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
  # end
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

  def move(index, current_player )
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

  def play
  	while (!over?) && (!won?) do
      	  turn
          draw?
    end
  end

  def position_taken?(index)
    if @board[index].nil? || @board[index].strip.empty?
      return false
    else return true
  end
  end

  def valid_move?(index)
    if !position_taken?(index) && index.between?(0,8)
      true
    else
      false
    end
  end


  def position_taken?(index)
    if @board[index].nil? || @board[index].strip.empty?
      false
    else true
    end
  end

  def turn_count
    count = 9
    @board.each do |position|
      if position.strip.empty?
         count -= 1
       end
    end
    count
  end

  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end
end

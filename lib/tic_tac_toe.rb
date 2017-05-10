
class TicTacToe

  def initialize
    @board = Array.new(9, " ")
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
    n = input.to_i
    index = n - 1
  end

  def move(index, token = "X")
    @board[index] = token
    return @board
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    elsif @board[index] == "X" || @board[index] == "O"
      return true
    end
  end

  def valid_move?(index)
    if index > 8 || index < 0
      return false
    elsif !position_taken?(index)
      return true
    else
      return false
    end
  end

  def turn_count
    count = 0
    @board.each do |position|
      if position == "X" || position == "O"
        count += 1
      end
    end
    return count
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    token = current_player
    if valid_move?(index)
  		board = move(index, token)
  	  puts display_board
  	else
      puts "invalid"
      user_input = gets.chomp
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
        return combo
      elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
        return combo
      end
    end
    return false
  end

  def full?
    @board.each do |position|
      if position == "" || position == " "
        return false
      end
    end
    return true
  end

  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end

  def over?
   WIN_COMBINATIONS.each do |combination|
   if won? == combination
     return true
   end
	 end
	 if draw?
	   return true
	 elsif full?
	   return true
	 end
	 return false
  end

  def winner
    WIN_COMBINATIONS.each do |combination|
    if won? == combination
      return @board[combination[0]]
    end
    end
    return nil
  end

  def play
    count = 0
    while count < 10 do
			if over? == true
				break
			end
			turn
			count += 1
		end
    if won?
			puts "Congratulations #{winner}!"
		end
		if draw?
			puts "Cat's Game!"
		end
  end 
end

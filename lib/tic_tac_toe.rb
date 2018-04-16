
class TicTacToe
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7],[2,5,8], [0,4,8], [2,4,6]]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")

  end

  def input_to_index(input)
    index = input.to_i-1
    return index
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, player_token = "X")
    @board[index] = player_token
    return @board
  end

  def position_taken?(index)
    if @board[index] == "" || @board[index] ==" " || @board[index] == nil
      return false
    elsif @board[index] =="X" || @board[index] == "O"
      return true
    end
  end

  def valid_move?(index)
    if index.between?(0,8) &! position_taken?(index)
      return true
    end
  end

  def turn
    puts "Please choose a free cell between 1-9"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player())
      display_board
    else
      puts "#{input} is invalid or already taken, please try again"
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |i|
      if i == "O" || i == "X"
        count +=1
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

  def x_and_o
    x_board = []
    o_board = []
    i = 0
    while i < @board.length
      if @board[i] == "X"
        x_board.push(i)
      elsif @board[i] == "O"
        o_board.push(i)
      end
      i+=1
    end
    puts "[#{x_board}, #{o_board}]"
    return [x_board, o_board]
  end

  def won?
    x_and_o_arr = x_and_o
    res_o=[]
    res_x =[]
    WIN_COMBINATIONS.each do |possibility|
        if (x_and_o_arr[0].include?(possibility[0]) && x_and_o_arr[0].include?(possibility[1]) && x_and_o_arr[0].include?(possibility[2]))
          res_x.push(possibility)
        elsif (x_and_o_arr[1].include?(possibility[0]) && x_and_o_arr[1].include?(possibility[1]) && x_and_o_arr[1].include?(possibility[2]))
          res_o.push(possibility)
        end
      end
      puts "#{res_o}"
      puts "#{res_x}"
      if res_o.length == 0 && res_x.length == 0
        return false
      elsif res_o.length > res_x.length
        return res_o[0]
      else
        return res_x[0]
      end
  end

  def full?
    x_and_o_arr = x_and_o
    if x_and_o_arr[0].length + x_and_o_arr[1].length < 9
      return false
    else
      return true
    end
  end

  def draw?
    if full? && !won?
      return true
    elsif won?
      return false
    end
  end


  def over?
    if won? || draw? || full?
      return true
    else
      return false
    end
  end

  def winner
    x_and_o_arr = x_and_o
    res_o=[]
    res_x =[]
    WIN_COMBINATIONS.each do |possibility|
       if (x_and_o_arr[0].include?(possibility[0]) && x_and_o_arr[0].include?(possibility[1]) && x_and_o_arr[0].include?(possibility[2]))
          res_x.push(possibility)
        elsif (x_and_o_arr[1].include?(possibility[0]) && x_and_o_arr[1].include?(possibility[1]) && x_and_o_arr[1].include?(possibility[2]))
          res_o.push(possibility)
        end
      end
      if res_o.length > res_x.length
        return "O"
      elsif res_o.length == res_x.length
        return nil
      else
        return "X"
      end
  end

  def play
    while !over? do
      turn
    end
    if won?
      win = winner
      puts "Congratulations #{win}!"
    else
      puts "Cat\'s Game!"
    end
  end
end

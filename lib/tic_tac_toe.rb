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
  def initialize(gamearr = Array.new(9, " "))
    @board =gamearr
  end

  def board
    @board
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

  def move(index, current_player)
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
  counter = 0
    @board.each do |value|
      if value=="X" || value=="O"
        counter+=1
      end
    end
    return counter
  end

  def current_player
    remainder = turn_count%2
    if remainder == 0
      return "X"
    else
      return"O"
    end
  end

  def won?
  #players = ["X","O"]
    won=false

    WIN_COMBINATIONS.each do |arr|
      if @board[arr[0]]=="X" || @board[arr[0]]=="O"
        if @board[arr[0]]==@board[arr[1]] && @board[arr[0]]==@board[arr[2]]
          won=true
          return arr
        end
      end
    end
    return won
  end

  def full?
    return @board.none?{|i| i==" " || i==""}
  end

  def draw?
    return full? == true && won? == false
  end

  def over?
    return won? != false || full? == true

  end

  def winner
  winarr=[]
    if over? && !draw?
      winarr=won?
      return @board[winarr[0]]
    else
      return nil
    end
  end

  def play
    until over? || draw?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end

class TicTacToe

  def initialize()
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # left Horizontal row
    [1,4,7],  # middle Horizontal row
    [2,5,8],  # right Horizontal row
    [0,4,8],  # diagonal one
    [2,4,6]  # diagonal two
  ]

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

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn()
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player())
      display_board()
    else
      turn()
    end
  end

  def turn_count()
    retcount = 0
    @board.each do |whoo|
      if whoo == "X" || whoo == "O"
        retcount = retcount + 1
      end
    end
    retcount
  #return number of turns that have been played
  end

  def current_player()
    cur = turn_count()

    if cur % 2 == 0
      "X"
    else
      "O"
    end

  end

  def won?()
    #iterate over combinations
    #see any combinations have matching symbols
    #go over combo
    woncom = []
    WIN_COMBINATIONS.each do |i|
    #for each combo get the board spots
      spot1 = @board[i[0]]
      spot2 = @board[i[1]]
      spot3 = @board[i[2]]
    #if board spots match return that combo
      if spot1 == "X" && spot2 == "X" && spot3 == "X" || spot1 == "O" && spot2 == "O" && spot3 == "O"
      woncom << i[0]
      woncom << i[1]
      woncom << i[2]
      end
    #else return nil
    end
    if woncom == []
      false
    else
      woncom
    end
  end

  def full?()
  @board.none?{|i| i == " "}
  end

  def draw?()
    if full?() == true && won?() == false
      true
    else
      false
    end

  end

  def over?()
    full?() || won?() || draw?()
  end

  def winner()
    win = won?()
    if win != false
      tar = win[0]
      if @board[tar] == "X"
        ret = "X"
      elsif @board[tar] == "O"
        ret = "O"
      end
      ret
    else
      nil
    end
  end

  #todo define this method
  def play()
    until over?()
      turn()
    end
    winn = winner()
    if winn != nil
      puts "Congratulations #{winn}!"
    else
      puts "Cat's Game!"
    end

  end

end

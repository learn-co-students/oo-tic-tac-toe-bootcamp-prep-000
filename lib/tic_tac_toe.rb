class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]  # M,iddle row
    # ETC, an array for each win combination
  ]

  def display_board
    print " #{@board[0]} | #{@board[1]} | #{@board[2]} \n"
    print "-----------\n"
    print " #{@board[3]} | #{@board[4]} | #{@board[5]} \n"
    print "-----------\n"
    print " #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
  end

  def input_to_index(user_input)
    user_input.to_i-1
  end

  def move(index, character)
    @board[index] = character
    @board
  end

  def position_taken?(index)
    if  (@board[index]== "" || @board[index]== " " || @board[index] == nil)
      false
    else
      true
    end
  end

  def valid_move?(index)
    if (index.between?(0,8) && !position_taken?(index))
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
      if valid_move?( index)
        move(index, current_player)
        display_board
      else
        turn
      end
  end



  def turn_count
    count = 0
    @board.each do |position|
      if (position == "X" || position == "O")
        count += 1
      end
    end
    count
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end


  def won?
    WIN_COMBINATIONS.each do |combination|
      position_1 = @board[combination[0]]
      position_2 = @board[combination[1]]
      position_3 = @board[combination[2]]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return combination # return the win_combination indexes that won.
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return combination
      end
    end
    false
  end

  def full?
    !@board.include?(" ")
  end

    def draw?
      if won? == false && full?
        true
      else
        false
      end
    end

  def winner
    value = won?
    if value != false
      @board[value[0]]
    end
  end

  def over?
    if won? || draw? || full?
     true
    else
      false
    end
  end


  def play
    until over?
      turn
    end

    if won?
      if winner == "X"
        puts "Congratulations X!"
      else
        puts "Congratulations O!"
      end
    else
      puts "Cat\'s Game!"
    end
  end


end

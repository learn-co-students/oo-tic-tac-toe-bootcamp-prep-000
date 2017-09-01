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
    @board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    @index = input.to_i - 1

    if @index < 0
      return -1
    end

    return @index
  end

  def move(index, token = 'X')
    return @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0, 8) && position_taken?(index) == false
  end

  def turn
    puts "Please enter 1-9:"

    input = gets.strip
    index = input_to_index(input)

    if valid_move?(index)
      token = current_player
      move(index, token)
      display_board
    else
      puts "That isn't a valid move"
      turn
    end
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      #
      all_taken = win_combo.all? do |index|
        position_taken?(index)
      end #end all taken.all

      if all_taken
        # puts "full combo #{win_combo}"

        all_X = win_combo.all? do |index|
          @board[index] == 'X'
        end  #end all X

        all_O = win_combo.all? do |index|
          @board[index] == 'O'
        end  #end all O

      end #end if all taken
      #
      if all_X || all_O
        # puts "allX #{all_X} or All O #{all_O}"
        return win_combo
        return all_X
        return all_O
      end #end if all_X

    end #end WIN_COMBINATIONS each
    return false
  end

  def full?
    @board.all? do |index|
      !(index.nil? || index == " ")
    end
  end

  def draw?
    full = full?
    won = won?

    if full && !won
      return true
    end

    if !full && !won
      return false
    end

    if won
      return false
    end
  end

  def over?
      full? || draw? || won?
  end

  def winner
    win_combo = won?
    if win_combo != false

      if win_combo.all?{|index| @board[index] == 'X'}
        return 'X'
      end

      if win_combo.all?{|index| @board[index] == 'O'}
        return 'O'
      end
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    end

    if draw?
      puts "Cat's Game!"
    end
  end


end #end of class

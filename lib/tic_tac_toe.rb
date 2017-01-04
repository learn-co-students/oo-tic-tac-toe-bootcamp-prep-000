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
   [2, 4, 6],
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

  def turn
      puts "Please enter 1-9:"
      input = gets.chomp
      index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
      else
        puts "That is not a valid move."
        turn
      end
      display_board
  end

  def turn_count
    counter = 0
    @board.each do |move|
      if move == "X" or move == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end

  def won?
    if
    WIN_COMBINATIONS.each do |win_combination|
      position_1 = win_combination[0]
      position_2 = win_combination[1]
      position_3 = win_combination[2]
       if @board[position_1] == "X" && @board[position_2] == "X" && @board[position_3] == "X"
         return win_combination
       elsif @board[position_1] == "O" && @board[position_2] == "O" && @board[position_3] == "O"
         return win_combination
     end
   end
   else
     return false
   end
  end

  def full?
   @board.all? do |index|
     !(index == nil || index == " " || index == "")
   end
  end

  def empty?
    @board.all? do |index|
      (index == nil || index == " " || index == "")
    end
   end

  def draw?
    !won? && full?
  end


  def over?
    full? || won? || draw?
  end

  def winner
    if !won?
      return nil
    else
      won?.each do |index|
        return @board[index]
      end
    end
  end


  def play
       while !over?
         turn
       end
        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cats Game!"
        end
     end

  end

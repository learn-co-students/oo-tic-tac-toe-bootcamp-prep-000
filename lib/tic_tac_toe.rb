class TicTacToe
  WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 3, 6], # left column
  [1, 4, 7], # middle column
  [2, 5, 8], # right column
  [0, 4, 8], # left diagonal
  [2, 4, 6]  # right diagonal
]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
     input.to_i - 1
  end

  def move(index, current_player)
     @board[index] = current_player
  end

  def position_taken?(index)
    return (@board[index] == " " || @board[index] == '' || @board[index] == nil) ? false : true
  end

  def valid_move?(index)
    return (!position_taken?(index) && index.between?(0,8)) ? true : false
  end

  def turn_count
    count = 0
    @board.each do |position|
      if position == "X" || position == "O"
        count += 1
      end
    end
    return count #interger
  end

  def current_player
    turn_count.even? ?  "X" :   "O"
  end

  def turn
    puts "Please enter a number between 1-9"
    user_input = gets.strip

    index = input_to_index(user_input)

      if (valid_move?(index))
        move(index, current_player)
      else
        turn
      end
      display_board
    end

    def won?
    win_combo = []
    won = false

    WIN_COMBINATIONS.each do |combo|
      combo.each do |i|
        win_combo.push(@board[i])
      end
      if (win_combo.all? { |i| i == "X"} || (win_combo.all? { |i| i=="O"}))
        return combo
      else
        win_combo = []
      end
    end
    return won
  end

  def full?
    @board.none?{ |i| i == " "}
  end

  def draw?
    full? && !won? ? true : false
  end

  def over?
    if (full? || (won? != false) || draw?)
       return true
    end
  end

  def winner
    winner = nil
    combo = []

    if(over? && won?)
      combo = won?
      winner = @board[combo[0]]
    end
    return winner
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
      else
      puts "Cat's Game!"
    end
  end

end

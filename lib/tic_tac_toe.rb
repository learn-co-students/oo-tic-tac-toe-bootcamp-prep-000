class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

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

  def input_to_index(user_input)
    index = user_input.to_i
    index -= 1
  end

  def move(index, character="X")
    @board[index] = character
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if position_taken?(index) == false && index.between?(
      0,@board.length
      )
      return true
    else
      return false
    end
  end

  def turn

    puts "Please enter 1-9:"
    user_input=gets.strip
    index = input_to_index(user_input)

    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      end
    end
  false
  end

  def full?
    if @board.detect{|i| i == " "} == nil
      return true
    else
      false
    end
    false
  end

  def draw?
    if won?
      return false
    elsif full? == false
      return false
    else
      true
    end
  end

  def over?
    if won? || full? || draw?
      return true
    end
    false
  end

  def winner
    if won?
      return @board[won?[0]]
    end
  end

  def play
    until over? == true
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
    puts "Cat's Game!"
    end
  end

  def new_game=(play)
    @play =play
  end
end

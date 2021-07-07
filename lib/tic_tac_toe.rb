
class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  def board
    @board
  end

    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
    ]
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
  #user_input.strip
  user_input.to_i - 1
  end
  
  def move(index, player)
    @board[index] = player
  end
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  def turn_count
    @board.count {|x| x != " "}
  end
  def current_player
    turn_count % 2 == 0 ? 'X' : 'O'
  end
  def turn
    puts 'Please enter 1-9'
    input = gets.strip
    index = input_to_index(input)
  
    if valid_move?(index)
      player = current_player
      move(index, player)
      display_board
    else
      puts('invalid')
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end
  def full?
    if @board.detect {|x| x == " "}
    FALSE
    else
    TRUE
    end
  end
  def draw?
    if full? && !won?
    return TRUE
    else
    return FALSE
    end
  end
  def over?
    if draw? || won?
      return TRUE
    end
  end
  def winner
    if index = won?
      @board[index[0]]
    end
  end
  
  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end #class end, but not the end of class
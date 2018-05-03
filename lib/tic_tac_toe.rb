class TicTacToe
  
  WIN_COMBINATIONS = [
      [0,1,2], [3,4,5], [6,7,8],
      [0,3,6], [1,4,7], [2,5,8],
      [0,4,8], [2,4,6]
    ]
  
  def initialize
    @board = Array.new 9, " "
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-' * 11
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-' * 11
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, player = 'X')
    @board[index] = player
  end
  
  def position_taken?(index)
    @board[index] == 'X' || @board[index] == 'O'
  end
  
  def valid_move?(index)
    index < 9 && index >= 0 && !position_taken?(index)
  end
  
  def turn
    valid = FALSE
    until valid do
      puts "Pick a position(1-9):"
      turn_move = input_to_index(gets.strip)
      valid = valid_move?(turn_move)
    end
    move(turn_move, current_player)
    display_board
  end
  
  def turn_count
    @board.count {|slot| slot == 'X' || slot == 'O'}
  end
    
  def current_player
    turn_count % 2 == 0 ? 'X' : 'O'
  end
  
  def won?
    WIN_COMBINATIONS.find do |slots|
      ['X','O'].any? {|player| slots.all? {|slot| @board[slot]== player}}
    end
  end
  
  def full?
    turn_count == 9
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    if won?
      @board[won?[0]]
    end
  end
  
  def play
    until over? do
      turn 
    end
    if won? 
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end
  
end

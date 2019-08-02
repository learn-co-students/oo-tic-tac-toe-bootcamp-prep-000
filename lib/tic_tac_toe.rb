class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end 
  
  WIN_COMBINATIONS = [[0,1,2],
                      [3,4,5],
                      [6,7,8],
                      [0,3,6],
                      [1,4,7],
                      [2,5,8],
                      [0,4,8],
                      [6,4,2]]
                      
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
  
  def move(index, player)
    @board[index] = player
  end
  
  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end
  
  
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end
  
  def turn_count
    ans = @board.select { |ele| ele == 'X' || ele == 'O' }
    ans.count
  end
  
  def current_player
      turn_count.even? ? 'X' : 'O'
  end
  
  
  def won?
  WIN_COMBINATIONS.each do |combo|
    win_1 = combo[0]
    win_2 = combo[1]
    win_3 = combo[2]

    position_1 = @board[win_1]
    position_2 = @board[win_2]
    position_3 = @board[win_3]

    if position_1 == position_2 && position_2 == position_3 && position_taken?(win_1)
      return combo
    end
  end
   false || nil
end


def full?
 !@board.any?{ |ele| ele == ' ' }
end


def draw?
 if won?
   false
 else
  full?
 end
end


def over?
  won? || draw? || full?
end

def winner
  res = won?
  if res
    @board[res[0]]
  else
    false || nil
  end
end


  def turn
      puts 'Please enter 1-9:'
    
      user_input = gets.strip
      index = input_to_index(user_input)
    
       valid_move?(index ) ? move(index, current_player) : turn
    
       display_board
  end
  
  def play
    until over?
      turn
    end
  
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end 
  
end 
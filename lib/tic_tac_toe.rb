class TicTacToe

def initialize(board = [" "," "," "," ", " "," "," "," "," "])
  @board = board
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

def move(index, token)

  @board[index] = token
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)

end

def turn_count
  counter = 0
@board.each do |space|

    if (space != ' ')
    counter += 1
    else
    end
  end
  return counter
end

def current_player
token=['X','O']
turn_number = turn_count + 1
token_number = turn_number/2-(turn_number-1)/2
return token[token_number]
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
   puts "That is an invalid move. Try again."
   puts "Please enter 1-9:"
   input = gets.strip
   index = input_to_index(input)
   if valid_move?(index)

     token = current_player
     move(index, token)
     display_board
   end
  end

end

def won?
  if @board.none?{|i| i=='X'} && @board.none?{|i| i=='O'}
    return false
  elsif WIN_COMBINATIONS.each do |potential_winner|
              win_index1=potential_winner[0]
              win_index2=potential_winner[1]
              win_index3=potential_winner[2]
              if @board[win_index1] == 'X' && @board[win_index2] == 'X' && @board[win_index3] == 'X'
                return array = [win_index1,win_index2,win_index3]
              elsif @board[win_index1] == 'O' && @board[win_index2] == 'O' && @board[win_index3] == 'O'
                return array = [win_index1,win_index2,win_index3]
              end
                        end
  elsif full?
    return false


end
  return false
end

def full?
  @board.none? do |what|
    what == " "
  end
end

def draw?
  if !won? && full?
    return true
  end
end



def over?
  if (won?|| draw?)
    return true
  end
  return false

end


def winner
  if !won?
    return nil
  else

    WIN_COMBINATIONS.each do |potential_winner|
      win_index1=potential_winner[0]
      win_index2=potential_winner[1]
      win_index3=potential_winner[2]
      if @board[win_index1] == 'X' && @board[win_index2] == 'X' && @board[win_index3] == 'X'
        return winner = 'X'
      elsif @board[win_index1] == 'O' && @board[win_index2] == 'O' && @board[win_index3] == 'O'
        return winner = 'O'
      end
    end


  end
end

def play

  if over?
    if won?
      puts "Congratulations #{winner}!"
      return nil
    end
    puts "Cat's Game!"
    return nil
  end
  counter = 0
  while (counter <9)

    turn
    counter +=1

    if over?
      if won?
        puts "Congratulations #{winner}!"
        return true
      end
      puts "Cat's Game"
      return false
    end
  end

end

end

require_relative '../config/environment.rb'

# The human class is a subclass of player.
# It is instantiated within a one or two player game.
# This is the script that takes input from a human player
# to place tokens on the board.
class Human < Player
  def gets_token
    puts ''
    puts "#{@name}, please select a token. (X/O)"
    @token = gets.strip.upcase
    return unless @token != 'X' && @token != 'O'
    gets_token
  end

  def puts_token
    puts ''
    puts "You have selected #{@token}."
    puts ''
    sleep(1)
  end

  def sets_token(opponent)
    if opponent.nil?
      gets_token
      puts_token
    else
      @token = if opponent.token == 'X'
                 'O'
               else
                 'X'
               end
    end
  end

  def go(board, _)
    puts "#{@name}, please enter 1-9:"
    index = gets.strip.to_i - 1
    if valid_move?(board, index)
      move(board, index, @token)
      @token_set.push(index)
    else
      go(board, '')
    end
  end
end

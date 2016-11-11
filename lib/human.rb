require_relative 'player.rb'

class Human < Player
  def initialize
    @name = gets.strip
    @token_set = []
  end

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

  def sets_token(opposition)
    if opposition.nil?
      gets_token
      puts_token
    else
      @token = if opposition.token == 'X'
                 'O'
               else
                 'X'
               end
    end
  end

  def turn(board)
    puts ''
    puts "#{@name}, please enter 1-9:"
    input = gets.strip
    make_move(board, input)
  end
end

def make_move(board, input)
  if valid_move?(board, input)
    move(board, input, @token)
    puts ''
    board.display
    puts ''
    puts ''
  else
    turn(board)
  end
end

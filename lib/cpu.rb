require_relative 'player.rb'

class CPU < Player
  def initialize
    input = gets.strip
    @name = if input != ''
              input
            else
              'HAL'
            end
    @token_set = []
  end

  def sets_token(opposition)
    @token = if opposition.token == 'X'
               'O'
             else
               'X'
             end
  end

  def best_move(board, opponent)
    status(board, self, opponent)
    if win_possible?(opponent)
      winning_position
    elsif opponent.win_possible?(self)
      opponent.winning_position
    elsif opponent.token_set.length == 1
      opponent.token_set[0] == 4 ? 0 : 4
    else
      rand(9)
    end
  end

  def turn(board, opponent)
    input = best_move(board, opponent) + 1
    make_move(board, opponent, input)
  end

  def make_move(board, opponent, input)
    if valid_move?(board, input)
      move(board, input, @token)
      puts "#{@name}: I'll pick #{input}."
      sleep(1)
      puts ''
      board.display
      puts ''
    else
      turn(board, opponent)
    end
  end
end

require_relative 'player.rb'

# The CPU class is a subclass of Player. It is the script that
# governs the way the computer plays the game against a human player,
# including how to determine its name, token, best move at any time,
# and how to play a turn
class CPU < Player
  def sets_token(opposition)
    @token = if opposition.token == 'X'
               'O'
             else
               'X'
             end
  end

  def best_move(opponent)
    return winning_position if win_possible?(opponent)
    return opponent.winning_position if opponent.win_possible?(self)
    return rand(9) unless opponent.token_set.length == 1
    opponent.token_set[0] == 4 ? 0 : 4
  end

  def go(board, opponent)
    input = best_move(opponent) + 1
    make_move(board, opponent, input)
  end

  def make_move(board, opponent, input)
    if valid_move?(board, input)
      move(board, input, @token)
      puts "#{@name}: I'll pick #{input}."
      sleep(1)
      puts input.to_s
      puts ''
      board.display
      puts ''
    else
      go(board, opponent)
    end
  end
end

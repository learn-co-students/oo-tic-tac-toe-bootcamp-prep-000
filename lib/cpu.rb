require_relative '../config/environment.rb'

# The CPU class is a subclass of Player. It is the script that
# governs the way the computer plays the game against a human player,
# including how to determine its name, token, best move at any time,
# and how to play a turn
class CPU < Player
  def sets_token(opponent)
    @token = if opponent.token == 'X'
               'O'
             else
               'X'
             end
  end

  def best_move(opponent)
    return winning_index if win_possible?(opponent)
    return opponent.winning_index if opponent.win_possible?(self)
    return best_early_move_for_player_two(opponent) unless is_player_one?
    best_early_move_for_player_one(opponent)
  end

  def best_early_move_for_player_two(opponent)
    return rand(9) unless @token_set.length == 0
    opponent.token_set[0] == CENTER ? CORNERS.sample : CENTER
  end

  def best_early_move_for_player_one(opponent)
    return CORNERS.sample if @token_set.length == 0
    opposite_corner = (@token_set[0] - 8).abs
    return opposite_corner if opponent.token_set[0] != opposite_corner
    CORNERS.sample
  end

  def go(board, opponent)
    input = best_move(opponent) + 1
    if valid_move?(board, input)
      puts "#{@name}: I'll pick #{input}."
      sleep(1)
      puts input
      move(board, input, @token)
      @token_set.push(input.to_i - 1)
    else
      go(board, opponent)
    end
  end
end

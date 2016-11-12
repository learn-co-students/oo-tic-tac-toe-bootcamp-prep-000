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

  def best_move(board, opponent)
    return winning_index if win_possible?(opponent)
    return opponent.winning_index if opponent.win_possible?(self)
    return best_early_move_for_player_two(board, opponent) unless player_one?
    best_early_move_for_player_one(board, opponent)
  end

  def best_early_move_for_player_two(board, opponent)
    if @token_set.empty?
      return opponent.token_set[0] == CENTER ? CORNERS.sample : CENTER
    end
    return CORNERS.sample if CORNERS.all? { |i| valid_move?(board, i) }
    return SIDES.sample if SIDES.all? { |i| valid_move?(board, i) }
    rand(9)
  end

  def best_early_move_for_player_one(board, opponent)
    return CORNERS.sample if @token_set.empty?
    opposite_corner = (@token_set[0] - 8).abs
    return opposite_corner if valid_move?(board, opposite_corner)
    return CORNERS.sample if CORNERS.any? { |i| valid_move?(board, i) }
    rand(9)
  end

  def go(board, opponent)
    index = best_move(board, opponent)
    if valid_move?(board, index)
      puts "#{@name}: I'll pick #{index + 1}."
      sleep(1)
      puts index + 1
      move(board, index, @token)
      @token_set.push(index)
    else
      go(board, opponent)
    end
  end
end

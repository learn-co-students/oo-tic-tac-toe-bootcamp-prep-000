$x_first = true

class AiTTT < TicTacToe

  def initialize
    @board = Array.new(9, " ")
    @root = AiPos.new(@board)
    @trav = @root
  end

  def current_player
    if $x_first
      turn_count % 2 == 0 ? "X" : "O"
    else
      turn_count % 2 == 0 ? "O" : "X"
    end
  end

  def computer_turn
    move(@trav.likely_next_move.new_index + 1, current_player)
    @trav = @trav.likely_next_move
    display_board
    puts "\n"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip.to_i
    if valid_move?(input)
      move(input, current_player)
      @trav = @trav.next_moves.find {|pos| pos.new_index == input - 1}
      display_board
    else
      turn
    end
  end

  def ai_play
    puts "Would you like to go first?     y/n:"
    $x_first = gets.strip =~ /[yY]/ ? false : true
    until won? || draw? || over?
      ($x_first && current_player == 'X') || (!$x_first && current_player == 'O') ? computer_turn : turn
    end
    puts "Congratulations #{winner}!" if won?
    puts "Cats Game!" if draw?
    puts "\nPlay again?                    y/n:"
    reset if gets.strip =~ /[yY]/
  end

  def reset
    @board = Array.new(9, " ")
    @trav = @root
    ai_play
  end
end

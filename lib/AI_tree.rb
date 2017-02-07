class AiPos < TicTacToe

  attr_accessor :score, :new_index, :next_moves, :likely_next_move

  def initialize(board, new_index = "null")

      # set board position
      @board = board
      @new_index = new_index
      @next_moves = []

      # update board
      move(new_index + 1, current_player) if @new_index != "null"

      if over?
        # set score
        if won? && winner == 'O'
          @score = 3
        elsif draw?
          @score = 2
        elsif won? && winner == 'X'
          @score = 1
        end
      else
        # recursively create tree leaves
        (0..8).each {|i| @next_moves << AiPos.new(@board.join.chars, i) if !position_taken?(i)}

        # set minmax
        if current_player == 'X'              # best computer move
          @likely_next_move = @next_moves.min_by {|pos| pos.score }
        else                                  # predicting human move
          @likely_next_move  = @next_moves.max_by {|pos| pos.score }
        end

        @score = @likely_next_move.score
      end

  end
end

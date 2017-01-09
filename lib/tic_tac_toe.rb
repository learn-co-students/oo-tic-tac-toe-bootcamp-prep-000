class TicTacToe
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
  def initialize(board = nil)
    @board = @board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move (index, player)
    @board[index] = player
  end

  def valid_move?(index)
    begin
      index = Integer(index)
    rescue Exception
      return false
    end
    index.between?(0,8) && !position_taken?(index)
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def won?
    if@board.all?{|v| v == " "}
      return false
    end
    WIN_COMBINATIONS.each do | winning_combo_indicies |
      winning_index_one = winning_combo_indicies[0]
      winning_index_two = winning_combo_indicies[1]
      winning_index_three = winning_combo_indicies[2]
      if @board[winning_index_three] == "" || @board[winning_index_three] == " " || @board[winning_index_three] == nil
        false
      elsif @board[winning_index_one] == @board[winning_index_two] && @board[winning_index_two] == @board[winning_index_three]
        return winning_combo_indicies
      end
    end
    false
  end

  def full?
    !(@board.any?{|i| i == " "})
  end

  def draw?
    full? && !(won?)
  end

  def over?
    won? || draw?
  end

  def winner
    winningCombo = won?
    if winningCombo
      winner = @board[winningCombo[0]]
    end
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)

    if valid_move?(index)
      move(index,current_player )
      display_board
    else
      turn
    end
  end

  def play
    while !(over? )
      turn
   end
   if(won? )
     puts "Congratulations #{winner }!"
   else
     puts "Cats Game!"
   end
  end
end

class TicTacToe
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                      [0, 3, 6], [1, 4, 7], [2, 5, 8],
                      [2, 4, 6], [0, 4, 8]]

  def initialize(board = nil)
    @board = board || [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    @position = input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if (index >= 0 && index < 9) && position_taken?(index) == false
      return true
    end
  end

  def turn_count
    turn = 0
    @board.each do |piece|
      if piece == "X" || piece == "O"
        turn += 1
      end
    end
    return turn
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)

    if valid_move?(index)
      move(index, current_player)
      display_board

    else
      puts "Invalid move"
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.find do |win_combo|
      if @board[win_combo[0]] == @board[win_combo[1]] &&
         @board[win_combo[1]] == @board[win_combo[2]] &&
         position_taken?(win_combo[0])
        return win_combo
      end
    end
    return false
  end

  def full?
    if @board.detect{|char| char == " " || char == ""}
      return false
    else
      return true
    end
  end

  def draw?
    if full? == true && won? == false
      return true
    else
      return false
    end
  end

  def over?
    if draw? == true || won? != false
      return true
    else
      return false
    end
  end

  def winner
    if won? == false
      return nil
    else
      return @board[won?[0]]
    end
  end

  def play
    while !over?
      if !won?
        turn
      end
    end
    if won? != false
      if winner == "X"
        puts "Congratulations X!"
      else
        puts "Congratulations O!"
      end
    end
    if draw?
      puts "Cat's Game!"
    end
  end
end

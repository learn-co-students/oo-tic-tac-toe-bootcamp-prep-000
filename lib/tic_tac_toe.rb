class TicTacToe
  def initialize()
    @board = Array.new(9, " ")
  end
  WIN_COMBINATIONS= [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |winCombo|
      positions = [@board[winCombo[0]], @board[winCombo[1]], @board[winCombo[2]]]
      if positions[0] == positions[1] && positions[1] == positions[2]
        if positions[0] == "X" || positions[0] == "O"
          #win
          return winCombo
        end
      end
    end
    return false
  end

  def full?
    @board.all?{|i| i=="X" || i =="O"}
  end

  def draw?
    if !won?
        if full?
            return true
        end
    end
    return false
  end

  def over?
    if draw? || won? || full?
      return true
    end
    return false
  end

  def winner
    if won?.class == Array
      return @board[won?[0]]
    end
  end

  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations " + winner + "!"
    else
      puts "What's here?"
    end
  end

end

class TicTacToe
  def initialize()
    @board = Array.new(9, " ")
  end

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

  def display_board()
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
    @board[index.to_i - 1] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.to_i.between?(1, 9) && !position_taken?(index.to_i - 1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do | token |
      if token == "X" || token == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |wins|
      if @board[wins[0]] == "X" && @board[wins[1]] == "X" && @board[wins[2]] == "X"
        return wins
      elsif @board[wins[0]] == "O" && @board[wins[1]] == "O" && @board[wins[2]] == "O"
        return wins
      end
    end
    return false
  end

  def full?
    @board.all?{|token| token == "X" || token == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if draw? || !over?
      return nil
    else
      return @board[won?[0]]
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner()}!"
    elsif draw?()
      puts "Cats Game!"
    end
  end


end

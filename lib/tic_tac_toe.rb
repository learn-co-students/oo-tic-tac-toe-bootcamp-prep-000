class TicTacToe
  def initialize()
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, character = "X")
    @board[position.to_i - 1] = character
  end

  def position_taken?(index_number)
    if @board[index_number] == " " || @board[index_number] == "" || @board[index_number] == nil
      false
    else @board[index_number] == "X" || @board[index_number] == "O"
    end
  end

  def valid_move?(input)
    if position_taken?(input.to_i - 1) == false && input.to_i.between?(1, 9)
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
      display_board
    else turn
    end
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    counter = 0
    @board.each do |position|
      if position == "X" || position == "O"
        counter += 1
      end
    end
    counter
  end

  def won?
    winner = false
    WIN_COMBINATIONS.each do |wincombo|
      win_index_1 = wincombo[0]
      win_index_2 = wincombo[1]
      win_index_3 = wincombo[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        winner = wincombo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        winner = wincombo
      else
        false
      end
      break if winner
    end
    return winner
  end

  def full?
    @board.all? do |i|
      i == "X" || i == "O"
    end
  end

  def draw?
     !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if wincombo = won?
      @board[wincombo.first]
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end

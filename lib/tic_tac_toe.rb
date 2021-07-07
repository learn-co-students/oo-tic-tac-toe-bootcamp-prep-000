class TicTacToe

  def initialize
    @board=[" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def board
    @board
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
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

  def won?
    WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]

        if (position_1 == "X" && position_2 == "X" && position_3 == "X")
          return win_combination
        elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
          return win_combination
      end
    end
    false
  end

  def full?
    @board.all?{|index| index=='X'||index=="O"}
  end

  def draw?
    full?&&!won?
  end

  def over?
    won? || full? || draw?
  end

  def winner
      if win_combination = won?
      @board[win_combination.first]
    end
  end

  def turn_count
    counter = 0
    @board.each do |space|
      if space=="X" || space=="O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    if turn_count%2==1
      return "O"
    else
      return "X"
    end
  end

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

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end

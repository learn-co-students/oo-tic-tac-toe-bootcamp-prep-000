class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
  ]

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def display_board
    h_line = "-----------\n"
    l_1 = " #{@board[0]} | #{@board[1]} | #{@board[2]} \n"
    l_2 = " #{@board[3]} | #{@board[4]} | #{@board[5]} \n"
    l_3 = " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts l_1 + h_line + l_2 + h_line + l_3
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    !@board[index].nil? && @board[index] != " "
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    count = 0
    @board.each do |spot|
      count += 1 if spot != " "
    end
    count
  end

  def current_player
    (turn_count % 2 == 0) ? "X" : "O"
  end

  def turn
    puts "Enter a value between 1-9"
    input = gets.strip
    index = input_to_index(input)
    until valid_move?(index)
      puts "Enter a value between 1-9"
      input = gets.strip
      index = input_to_index(input)
    end

    move(index, current_player)
    display_board
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      var_1 = combo[0]
      var_2 = combo[1]
      var_3 = combo[2]

      if position_taken?(var_1) && position_taken?(var_2) && position_taken?(var_3)
        @board[var_1] == @board[var_2] && @board[var_2] == @board[var_3]
      end
    end
  end

  def full?
    turn_count == 9
  end

  def draw?
    !won? && full?
  end

  def over?
    !!won? || draw?
  end

  def winner
    combo_exists = won?
    @board[combo_exists[0]] if combo_exists
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end

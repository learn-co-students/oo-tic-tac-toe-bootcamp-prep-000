class TicTacToe
  def initialize
    board = Array.new(9, " ")
    @board = board
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

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == '' || @board[index] == ' ' || @board[index].nil?
      false
    else
      true
    end
  end

  def valid_move?(index)
    true if position_taken?(index) == false && index.between?(0, 8)
  end

  def turn
    puts 'Please enter 1-9:'
    input = gets.strip
    index = input_to_index(input)
    token = current_player

    if valid_move?(index)
      move(index, token)
      display_board
    else turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |turn|
      counter += 1 if turn == 'X' || turn == 'O'
    end
    counter
  end

  def current_player
    counter = turn_count

    counter.even? ? 'X' : 'O'
  end

  def won?
    WIN_COMBINATIONS.select do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == 'X' && position_2 == 'X' && position_3 == 'X'
        return win_combination
      elsif position_1 == 'O' && position_2 == 'O' && position_3 == 'O'
        return win_combination
      end
    end
    false
  end

  def full?
    @board.none? { |i| i == ' ' }
  end

  def draw?
    if !won? && full?
      true
    else
      false
    end
  end

  def over?
    true if won? || draw? || full?
  end

  def winner
    if winning = won?
      @board[winning[0]]
    end
  end

  def play
    turn until over?

    if won?
      winning = winner
      puts "Congratulations #{winning}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end

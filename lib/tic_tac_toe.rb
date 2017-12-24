class TicTacToe
  def initialize
    @board = Array.new(9, ' ')
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    # win by columns
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    # win by diangonal
    [0, 4, 8],
    [6, 4, 2]
  ]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-' * 11
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-' * 11
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(str)
    str.chomp.to_i - 1
  end

  def move(index, token = 'X')
    @board[index] = token
  end

  def position_taken?(position)
    ['X', 'O'].include?(@board[position])
  end

  def valid_move?(position)
    position.between?(0, 8) && !position_taken?(position)
  end

  def turn_count
    @board.select { |token| ['X', 'O'].include?(token)}.size
  end

  def current_player
    turn_count.even? ? 'X' : 'O'
  end

  def turn
    puts 'Select a position 1-9:'
    user_input = gets.chomp
    index = input_to_index(user_input)

    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    result = nil
    WIN_COMBINATIONS.each do |win_combination|
      count = 0
      first_index = win_combination.first
      if position_taken?(first_index)
        # count how many x's or o's are shown consecutively
        token = @board[first_index]
        win_combination.each do |index|
          count += 1 if @board[index] == token
        end
        result = win_combination if count == 3
      else
        # skip to next win_combination
        next
      end
    end
    result
  end

  def full?
    turn_count == @board.size
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || full?
  end

  def winner
    @board[won?.first] if !won?.nil?
  end

  def play
    turn until over?

    if won?
      puts "Congratulations, winner"
      exit
    else
      puts 'Something'
    end
  end



end

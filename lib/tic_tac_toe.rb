class TicTacToe
  attr_reader :board

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def initialize(board = [" "," "," "," "," "," "," "," "," "])
    @board = board
  end

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(position, mark)
    board[position] = mark
  end

  def position_taken?(position)
    !(board[position].nil? || board[position] == ' ')
  end

  def valid_move?(position)
    position.between?(0, 8) && !position_taken?(position)
  end

  def turn_count
    board.select{ |move| ['X', 'O'].include?(move)}.count
  end

  def current_player
    turn_count % 2 == 0 ? 'X' : 'O'
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      mark = current_player
      move(index, mark)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.any? do |comb|
      result = comb.reduce('') do |string, mark|
        string << board[mark]
      end
      return comb if result == 'XXX' || result == 'OOO'
    end
  end

  def full?
    board.any? { |m| [' ', '', nil].include?(m) } ? false : true
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw? || full? ? true : false
  end

  def winner
    winning_move = won?
    board[winning_move.first] if winning_move
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

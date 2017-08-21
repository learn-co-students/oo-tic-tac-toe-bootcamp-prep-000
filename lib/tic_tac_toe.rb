class TicTacToe

  def initialize
    @board = Array.new(9, " ");
  end

  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,4,8],
      [2,4,6],
      [0,3,6],
      [1,4,7],
      [2,5,8]
    ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(num)
    @num = (num.to_i) - 1
  end

  def move(index, token)
    @board[index]=token;
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    ((index >= 0) && (index < 9)) && !(position_taken?(index));
  end

  def turn_count
    @board.count{|char| char == 'X' || char == 'O'}
  end

  def current_player
    x = @board.count('X');
    o = @board.count('O');
    o < x ? 'O' : 'X'
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip;
    index = input_to_index(input);
    if (valid_move?(index))
      move(index, current_player);
      display_board
    else
      turn;
    end
    draw?
    won?
  end

  def won?
    WIN_COMBINATIONS.detect do |d|
      @board[d[0]]==@board[d[1]]&&
      @board[d[1]]==@board[d[2]]&&
      position_taken?(d[0])
    end
  end

  def full?
    @board.count(' ') == 0
  end

  def draw?
    full? && !(won?)
  end

  def over?
    won? || draw?
  end

  def winner
    if winning_combo = won?
      @board[winning_combo.first]
    end
  end

  def play
    while !over?
      turn;
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end

class TicTacToe
  WIN_COMBINATIONS =   [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]
  def initialize
    @board = Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(idx, token)
    @board[idx] = token
  end
  
  def position_taken?(idx)
    @board[idx] == "X" || @board[idx] == "O"
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
    count = 0
    @board.each do |pos|
      if pos == "X" || pos == "O"
        count += 1
      end
    end
    count
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
    b_size = @board.size - 1
    (0..b_size).each do |pos|
      if position_taken?(pos)
        marker = @board[pos]
        WIN_COMBINATIONS.each do |combo|
          if combo[0] == pos
            if combo.all? {|i| @board[i] == marker}
              return combo
            end
          end
        end
      end
    end
    false
  end
  
  def full?
    @board.all? {|pos| pos == "X" || pos == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full? || draw?
  end
  
  def winner
    win = won?
    if win
      return @board[win[0]]
    end
  end

  def play
    if !over?
      turn
      play
    end
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end
end
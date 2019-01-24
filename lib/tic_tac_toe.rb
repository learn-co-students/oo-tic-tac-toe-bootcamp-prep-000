class TicTacToe

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


  def initialize
    @board = Array.new(9," ")
  end

  def index=(index)
    @index = index
  end

  def index
    @index
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.strip.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == " "
      false
    else
      true
    end
  end

  def valid_move?(index)
    if @board[index] == " " && (0..8).include?(index)
      true
    else
      false
    end
  end

  def turn_count
    @board.count {|x| x == "X" || x == "O"}
  end

  def current_player
    turn_count%2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    token = current_player
      input = input_to_index(gets.chomp)
      if valid_move?(input)
        move(input, token)
        display_board
      else
        puts "Please enter 1-9:"
        input = input_to_index(gets.chomp)
      end
  end

  def won?
  winning_combo = nil
  WIN_COMBINATIONS.each do |combo|
    if combo.all? {|idx| @board[idx] == "X"}
      winning_combo = combo
    elsif combo.all? {|idx| @board[idx] == "O"}
      winning_combo = combo
    else
      false
    end
  end
  if winning_combo != nil
    winning_combo
  else
    false
  end
end

def full?
  @board.all? do |token|
    token == "X" || token == "O"
  end
end

def draw?
  if !won? && full?
    true
  end
end

def over?
  if won? || draw?
    true
  end
end

def winner
  winner = nil
  WIN_COMBINATIONS.each do |combo|
    if combo.all? {|id| @board[id] == "X"}
      winner = "X"
    elsif combo.all? {|id| @board[id] == "O"}
      winner = "O"
    else
    end
  end
  winner
end

def play
  turn until over?
    if winner
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
  end
end

end

game = TicTacToe.new

class TicTacToe

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

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
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

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != "" && @board[index] != nil
  end

  def valid_move?(index)
    if (index.between?(0,9) && !position_taken?(index))
      true
    else
      false
    end
  end

  def turn
    entry = -1
    loop do
      puts "Please enter 1-9:"
      entry = input_to_index(gets.strip)
      if valid_move?(entry)
        break
      end
    end
    move(entry, current_player)
    display_board
  end

  def turn_count
    counter = 0
    @board.each do |letter|
      if letter != " "
        counter += 1
      end
    end
    counter
  end

  def current_player
    turn_count.even? ? 'X' : 'O'
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if ((position_1 == "X" && position_2 == "X" && position_3 == "X") ||
          (position_1 == "O" && position_2 == "O" && position_3 == "O"))
        return win_combination
      end
    end
    false
  end

  def full?
    @board.all? {|val| !(val.nil? || val == " ")}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    result = won?
    if (result.class == Array)
      @board[result[0]]
    else
      nil
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end

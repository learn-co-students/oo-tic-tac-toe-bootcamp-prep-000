class TicTacToe
  #every method I build will be encapsulated in here
  WIN_COMBINATIONS =  [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board # ["X", "O", " ", " ", " ", " ", " ", " ", " "]
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move? (index)
    !position_taken?(index) && index.between?(0, 8)
  end

  def turn
    puts "Please enter 1-9:"
    cell_num = gets.strip
    index = input_to_index(cell_num)
    if valid_move?(index) == true
      move(index, current_player)
    else
      turn
    end
    puts display_board
  end

  def turn_count
    counter = 0
    @board.each do |position|
      if position == "X" || position == "O"
        counter +=1
      end
    end
    return counter # integer
  end

  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.find do |win_combo| #[0, 1, 2]
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if
        position_1 == position_2 && position_2 == position_3 && position_1 != " "
        return win_combo
      end
    end
  end

  def full?
    @board.all? do |position| # "X", "O", " "
      position == "X" || position == "O"
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      position = won?
      index = position[0]
      @board[index]
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

class TicTacToe
  def initialize(board=Array.new(9, " "))
    @board = board
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

  def display_board
    puts (" #{@board[0]} | #{@board[1]} | #{@board[2]} ")
    puts ("-----------")
    puts (" #{@board[3]} | #{@board[4]} | #{@board[5]} ")
    puts ("-----------")
    puts (" #{@board[6]} | #{@board[7]} | #{@board[8]} ")
  end

  def input_to_index(val)
    val.to_i-1
  end

  def move(index, token="X")
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
    if (index >= 0) && (index <= 8) && !position_taken?(index)
      true
    end
  end

  def turn
    puts "What up, wass your movings?"

    input = gets.strip

    index = input_to_index(input)

    token = current_player

    if valid_move?(index)
      move(index, token)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    for x in @board do
      if x == "O" || x == "X"
        count += 1
      end
    end
    count
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    # convert board to X's and O's
    # [X, X, X, O, O, X, O, O, X]
    tokens = ["X", "O"]

    # for loops may only work for non variables
    # use each
    # for combo in WIN_COMBINATIONS do
    #   if (@board[combo[0]] == token && @board[combo[1]] == token && @board[combo[2]] == token)
    #     return combo
    #   end
    # end
    tokens.each do |token|
      WIN_COMBINATIONS.any? do |combo|
        if @board[combo[0]] == token && @board[combo[1]] == token && @board[combo[2]] == token
          return combo
        end
      end
    end
    false
  end

  def full?
    for x in @board do
      if x == " "
        return false
      end
    end
    true
  end

  def draw?
    if full? && !won?
      true
    else
      false
    end
  end

  def over?
    if draw? || won?
      true
    else
      false
    end
  end

  def winner
    winning_player = won?
    if winning_player
      return @board[winning_player[0]]
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end
end

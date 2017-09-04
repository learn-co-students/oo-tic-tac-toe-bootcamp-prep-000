class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def board
    @board
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
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, character)
    @board[index] = character
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    counter = 0
    play_board = []
    board.each do |turn|
      if @board[counter] == "X" || @board[counter] == "O"
        play_board.push(board[counter])
        counter += 1
      else counter += 1
      end
    end
    play_board.length
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) != true
      turn
      end
    move(index, current_player)
    display_board
  end

  def won?
    new_board = []
  #1
    def empty
      @board.each do |turn|
        if turn == "" || turn == " "
          new_board << turn
        end
      end
    end
    if new_board.length == 9
      false
    end

  #2
    if @board[0] == "X" && @board[1] == "X" && @board[2] == "X"
      WIN_COMBINATIONS[0]
    elsif @board[3] == "X" && @board[4] == "X" && @board[5] == "X"
      WIN_COMBINATIONS[1]
    elsif @board[6] == "X" && @board[7] == "X" && @board[8] == "X"
      WIN_COMBINATIONS[2]
    elsif @board[0] == "X" && @board[3] == "X" && @board[6] == "X"
      WIN_COMBINATIONS[3]
    elsif @board[1] == "X" && @board[4] == "X" && @board[7] == "X"
      WIN_COMBINATIONS[4]
    elsif @board[2] == "X" && @board[5] == "X" && @board[8] == "X"
      WIN_COMBINATIONS[5]
    elsif @board[0] == "X" && @board[4] == "X" && @board[8] == "X"
      WIN_COMBINATIONS[6]
    elsif @board[2] == "X" && @board[4] == "X" && @board[6] == "X"
      WIN_COMBINATIONS[7]
    elsif @board[0] == "O" && @board[1] == "O" && @board[2] == "O"
      WIN_COMBINATIONS[0]
    elsif @board[3] == "O" && @board[4] == "O" && @board[5] == "O"
      WIN_COMBINATIONS[1]
    elsif @board[6] == "O" && @board[7] == "O" && @board[8] == "O"
      WIN_COMBINATIONS[2]
    elsif @board[0] == "O" && @board[3] == "O" && @board[6] == "O"
      WIN_COMBINATIONS[3]
    elsif @board[1] == "O" && @board[4] == "O" && @board[7] == "O"
      WIN_COMBINATIONS[4]
    elsif @board[2] == "O" && @board[5] == "O" && @board[8] == "O"
      WIN_COMBINATIONS[5]
    elsif @board[0] == "O" && @board[4] == "O" && @board[8] == "O"
      WIN_COMBINATIONS[6]
    elsif @board[2] == "O" && @board[4] == "O" && @board[6] == "O"
      WIN_COMBINATIONS[7]
    end
  end

  def full?
    full_board = []
    @board.each do |value|
      if value == "X" || value == "O"
        full_board << value
      end
    end
    if full_board.length == 9
      true
    end
  end

  def draw?
    if full? == true && !won?
      true
    end
  end

  def over?
    if draw? == true || full? == true || (won? != false && won? != nil)
      true
    end
  end

  def winner
    if won? != false && won? != nil
      @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    end
    if won?
      puts "Congratulations #{winner}!"
    end
  end


end

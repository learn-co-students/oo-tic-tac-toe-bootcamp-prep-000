class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  # Define your WIN_COMBINATIONS constant
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

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0, @board.length - 1) && !position_taken?(index)
  end

  def turn()
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board()
    else
      turn()
    end
  end

  def turn_count()
    count = 0
    @board.each do |element|
      if element == 'X' or element == 'O'
        count += 1
      end
    end
    return count
  end

  def current_player()
    turn_count().even? ? 'X' : 'O'
  end

  def won?()
      WIN_COMBINATIONS.each do |win_combination|
        position_1 = @board[win_combination[0]]
        position_2 = @board[win_combination[1]]
        position_3 = @board[win_combination[2]]
        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return win_combination # return the win_combination indexes that won.
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination # return the win_combination indexes that won.
        end
      end
      return false
  end

  def full?()
    @board.include?(" ") ? false : true
  end

  def draw?()
    if won?()
      false
    elsif full?()
      true
    end
  end

  def over?()
    draw?() or !@board.include?(" ") or won?() ? true : false
  end

  def winner()
    if !won?()
      nil
    elsif @board[won?()[0]] == "X"
      "X"
    else
      "O"
    end
  end

  def play()
    until over?()
      turn()
    end
    if won?()
      puts "Congratulations " + winner() + "!"
    else
      puts "Cat's Game!"
    end
  end

end

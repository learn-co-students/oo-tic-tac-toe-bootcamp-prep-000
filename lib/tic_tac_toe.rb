class TicTacToe

  def initialize(board = nil)
    @board = Array.new(9, " ")
  end

  def board
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
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index ,char)
    @board[index] = char
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
    else
      puts "Invalid move!"
      turn
    end
    display_board
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end


  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if win_combination.all? {|index| @board[index]== "X"} || win_combination.all? {|index| @board[index]== "O" }
        return win_combination
      end
    end
    return false
  end

  def full?
    @board.all? {|position| position == "X" || position == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || full? || won?
  end

  def winner
    if won?
      @board[won?[1]]
    else
      return nil
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner(board)}!"
    elsif draw?
      puts "Cats Game!"
    end
  end


end

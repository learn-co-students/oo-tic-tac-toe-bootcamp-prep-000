class TicTacToe
  def initialize
    @board = Array.new(9," ")
  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    return input.to_i - 1
  end

  def move(input, char)
    @board[input] = char
    return @board
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    else
      true
    end
  end

  def valid_move?(index)
    #index -= 1
    if index.between?(0,8) && !position_taken?(index)
      true
    else
      false
    end
  end

  def turn
    while true
      puts "Please enter 1-9:"
      index = input_to_index(gets.strip)
      break if valid_move?(index)
    end
    player = current_player
    move(index,player)
    display_board
  end

  def turn_count
    turns = @board.select {|x| x == "X" || x == "O"}
    turns.size
  end

  def current_player
    return "X" if turn_count%2 == 0
    "O"
  end

  def won?
    ["X","O"].each do |x|
      WIN_COMBINATIONS.each do |combo|
        if @board[combo[0]] == x
          if @board[combo[1]] == x
            if @board[combo[2]] == x
              return combo
            end
          end
        end
      end
    end
    nil
  end

  def full?
    @board.all? {|a| a == "X" || a == "O"}
  end

  def draw?
    if won?
      return false
    elsif full?
      return true
    end
    false
  end

  def over?
    if draw? || won?
      true
    end
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    puts "Welcome to Tic Tac Toe!"
    display_board
    until over?
      turn
    end
    if winner
      puts "Congratulations " + winner + "!"
    else
      puts "Cat's Game!"
    end
  end
end
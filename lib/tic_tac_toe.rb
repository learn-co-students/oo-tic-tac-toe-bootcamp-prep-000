class TicTacToe
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
  
  def move(index, player = "X")
    @board[index] = player
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end
  
  def turn
    puts "Please enter 1-9:"
    index = input_to_index(gets.strip)
    
    if valid_move?(index)
      move(index, current_player())
      display_board()
    else
      turn()
    end
  end
  
  def turn_count
    # @board.select { |cell| cell == "X" || cell == "O" }.length
    occupied_spaces = 0
  
    @board.each do |space|
      if !(space.nil? || space == " ")
        occupied_spaces += 1
      end
    end
    
    occupied_spaces
  end
  
  def current_player
    turn_count() % 2 == 0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
        return combo
      elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
        return combo
      end
    end
    
    false
  end
  
  def full?
    @board.none? { |cell| cell.nil? || cell == " " }
  end
  
  def draw?
    if won?()
      false
    elsif full?()
      true
    else
      false
    end
  end
  
  def over?
    won?() || draw?() || full?()
  end
  
  def winner
    won?() ? @board[won?()[0]] : nil
  end
  
  def play
    until over?() do
      turn()
    end
    
    if won?()
      puts "Congratulations #{winner()}!"
    elsif draw?()
      puts "Cat's Game!"
    end
  end
end
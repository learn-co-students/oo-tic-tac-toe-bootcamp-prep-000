class TicTacToe
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
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, current_player)
    @board[index] = current_player
  end
  
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
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
  
  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if(win_combo.all? {|index| (position_taken?(index))} && win_combo.all? {|a| @board[a] == "X"} || win_combo.all? {|a| @board[a] == "O"})
        return win_combo
      end
    end
    return false
  end
  
  def full?
    @board.none? {|ele| ele == " "}
  end

  def draw?
    full? ? !won? : false
  end
  
  def over?
    draw? || won? || full? ? true : false
  end
  
  def winner
    WIN_COMBINATIONS.each do |win_combo|
      if(win_combo.all? {|index| (position_taken?(index))})
        if(win_combo.all? {|ele| @board[ele] == "X"})
          return "X"
        elsif(win_combo.all? {|ele| @board[ele] == "O"})
          return "O"
        end
      end
    end
    return nil
  end
  
end
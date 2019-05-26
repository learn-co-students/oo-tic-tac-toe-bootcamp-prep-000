class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  
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
    @board[index] != " " || @board[index].nil?
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn
    puts "Please choose a spot by typing in a number between 1-9."
    input = gets.chomp
    index = input_to_index(input)
    s = valid_move?(index)
    if s == true
      move(index, current_player)
      display_board
    else s == false
      until s == true
        puts "Sorry, that was an invalid move. Please enter 1-9:"
        display_board
        i = gets.strip
        index = input_to_index(i)
        s = valid_move?(index)
        move(index, current_player)
      end
    end
  end
  
  def turn_count
    count = 0
    @board.each do |token|
      if token == "X" || token == "O"
        count += 1
      end
    end
    count
  end
  
  def current_player
    turn_count.even? ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.find do |win_combo|
      @board[win_combo[0]] == @board[win_combo[1]] &&
      @board[win_combo[0]] == @board[win_combo[2]] &&
      position_taken?(win_combo[1])
    end
  end
  
  def full?
    @board.none? {|x| x == " " || x.nil?}
  end
  
  def draw? 
    full? && won? == nil
  end
  
  def over?
    won? || draw? 
  end
  
  def winner
    if won?
      winner = @board[won?[0]]
    end
  end
  
  def play
    until over?
      turn
    end
    if draw?
       puts "Cat's Game!"
    else won?
       puts "Congratulations #{winner}!"
     end
  end
end
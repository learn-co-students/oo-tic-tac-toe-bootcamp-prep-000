class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, player_token = 'X')
    @board[index] = player_token
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
    player_token = current_player
    if valid_move?(index)
      move(index, player_token)
      display_board
    else turn
    end
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

#The test for won? fluctuated again. Now they want the winning combo returned again.
  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if win_combo.all? {|index| @board[index] == 'X'} || win_combo.all? {|index| @board[index] == 'O'}
        #return true
        return win_combo
      end
    end
    false
  end

  def valid_token?(i)
    i == 'X' || i == 'O'
  end

  def full?
    @board.all? {|token| valid_token?(token)}
  end

  def draw?
    !won? && full?
  end
  #issue with the test that it needs #won? to be called before #full?
  def over?
    #had to replace #full? with #draw? below unnecessarily to help #play pass its #draw test.
    draw? || won?
  end

  def winner
    WIN_COMBINATIONS.each do |win_combo|
      if win_combo.all? {|index| @board[index] == 'X'}
        return 'X'
      elsif win_combo.all? {|index| @board[index] == 'O'}
        return 'O'
      end
    end
    nil
  end

  def play
    until over?
      turn
      puts "X's and O's don't wear any clothes."
    end
    # learn spec/02_play_spec.rb
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
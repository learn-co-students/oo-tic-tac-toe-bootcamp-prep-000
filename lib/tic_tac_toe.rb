class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],  #top row
    [3,4,5],  #mid row
    [6,7,8],  #bot row
    [0,3,6],  #left col
    [1,4,7],  #mid col
    [2,5,8],  #right col
    [0,4,8],  #left dig
    [2,4,6]   #right dig
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

  def move(index, char='X')
    @board[index] = char
  end

  def position_taken?(index)
    if @board[index] == ' '
      return false
    end
    true
  end

  def valid_move?(index)
    ((0..8).include?(index)) && (not position_taken?(index))
  end

  def turn
    puts "Please enter position:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      player = current_player()
      move(index,player)
      display_board()
    else
      puts "Invalid number entered"
      turn()
    end
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if position_taken?(combo[0]) && @board[combo[0]]==@board[combo[1]] && @board[combo[1]]==@board[combo[2]]
        return combo
      end
    end
    return false
  end

  def full?
    (0..8).all? { |e| position_taken?(e) }
  end

  def draw?
    full?() && !won?()
  end

  def over?
    won?() || draw?() || full?()
  end

  def winner
    if won?()
      return @board[won?()[0]]
    else
      return nil
    end
  end

  def play
    until over?()
      turn()
    end
    if won?()
      puts "Congratulations #{winner()}!"
    elsif draw?()
      puts "Cat's Game!"
    end
  end

end

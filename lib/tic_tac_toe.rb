class TicTacToe

  def initialize(board=nil)
    @board = Array.new(9," ")
  end

  WIN_COMBINATIONS = [

    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]

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

  def move(input, player)
    @board[input] = player
  end

  def position_taken?(index)
    @board[index] != " " ? true : false
  end

  def valid_move?(index)
    !position_taken?(index) && (0..8).include?(index) ? true : false
  end

  def turn_count
    @board.count {|el| el != " "}
  end

  def current_player
    turn_count.even? ? "X" : "O"
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
    WIN_COMBINATIONS.each do |combo|
        if @board[combo[0]] == @board[combo[1]] &&
          @board[combo[1]] == @board[combo[2]] &&
          position_taken?(combo[0])
          return combo
        end
    end
    false
  end

  def full?
    @board.none? {|el| el == " "}
  end

  def draw?
    (full? && !won?) ? true : false
  end

  def over?
    (won? || draw?) ? true : false
  end

  def winner
    if won?
     @board.count("X") > @board.count("O") ? "X" : "O"
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
    
  end

end

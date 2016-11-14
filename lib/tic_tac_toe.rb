class TicTacToe
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

  def initialize(board=Array.new(9, " "))
    @board = board
  end

  def move(index, token)
      @board[index-1] = token
  end

  def position_taken?(position)
    @board[position] != " " && @board[position] != ""
  end

  def valid_move?(position)
    position = position.to_i-1
    position <= 8 && position >= 0 && !position_taken?(position)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input.to_i
    if valid_move?(index)
      move(index, current_player())
    else
      turn()
    end
    display_board()
  end

  def turn_count
    count = 0
    @board.select{|turn| turn != "" && turn != " "}.size
  end

  def current_player
    turn_count().even?? 'X' : 'O'
  end

  def won?
    WIN_COMBINATIONS.find do |combi|
      # check if squares match and make sure they're not "" or " "
       @board[combi[0]] == @board[combi[1]] && @board[combi[2]] == @board[combi[1]] && position_taken?(combi[0])
    end
  end

  def full?
    @board.none? {|square| square == "" || square == " "}
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      @board[won?[0]]
    else
      nil
    end
  end

  def display_board()
      puts " #{@board[0]}" + " | " + "#{@board[1]}" + " | " + "#{@board[2]} "
      puts "-----------"
      puts " #{@board[3]}" + " | " + "#{@board[4]}" + " | " + "#{@board[5]} "
      puts "-----------"
      puts " #{@board[6]}" + " | " + "#{@board[7]}" + " | " + "#{@board[8]} "
    end

  def play
    while !over?
      turn()
    end
    if won?
      puts "Congratulations #{winner()}!"
      return
    elseif draw?
      puts "It's a draw!"
      return
    else
      puts "Cats Game!"
      return
    end
  end


end

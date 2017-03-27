class TicTacToe
  def initialize
    @board=Array.new(9," ")
  end

  WIN_COMBINATIONS=[
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

  def input_to_index(number)
    number.to_i-1
  end

  def move(position,character)
    @board[position]=character
  end

  def position_taken?(index)
    if @board[index] ==" " || @board[index]==nil || @board[index]==""
      false
    else
      true
    end
  end

  def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    count=0;
    @board.each do |turn|
      if turn=="O" || turn=="X"
        count+=1
      end
    end
    count
  end

  def current_player
    #count=turn_count(board)
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    index=input_to_index(gets.strip)

    if valid_move?(index)
        move(index,current_player)
    else
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1=win_combination[0]
      win_index_2=win_combination[1]
      win_index_3=win_combination[2]

      position_1=@board[win_index_1]
      position_2=@board[win_index_2]
      position_3=@board[win_index_3]

      if position_1==position_2 && position_2==position_3 && position_3!=" "
        return win_combination
      end
    end
    false
  end

  def full?
    @board.none?{|chara| chara==" "||chara==""}
  end

  def draw?
    won? ? false : full?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if combination=won?
      #combination=won?(board)
      return @board[combination[0]]
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end

end

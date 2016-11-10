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

  def play
    while !over? do
        turn
      end
      if won?
        puts "Congratulations " + winner + "!"
      else
        puts "Cats Game!"
      end
  end

  def turn

    puts "Please enter 1-9:"
    input = gets.strip


    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |box|
      if box != " "
        counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def input_to_index(input)
      input.to_i - 1
  end

  def move(input, team)
    index = input_to_index(input)
    @board[index] = team
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(input)
    index = input_to_index(input)
    !(position_taken?(index)) && index.between?(0, 8)
  end


  def won?
    xcounter = 0
    ocounter = 0
    WIN_COMBINATIONS.each do |combo|

      combo.each do |el|

        if @board[el] == "X"
          xcounter += 1
        end

        if @board[el] == "O"
          ocounter += 1
        end

        if ocounter == 3 || xcounter == 3
          return combo
        end

      end
      xcounter = 0
      ocounter = 0

    end
  false
  end

  def full?
    @board.none? do |el|
      @board[el.to_i - 1] == " "
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      return @board[won?[0]]
    end
    nil
  end

end

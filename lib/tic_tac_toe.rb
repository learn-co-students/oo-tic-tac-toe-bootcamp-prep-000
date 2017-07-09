class TicTacToe
  def initialize
    @board = Array.new(9, " ")
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
    player = current_player
    puts "Player #{player} please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, player)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each_index do |i|
      if position_taken?(i)
        count +=1
      end
    end
    count
  end

  def current_player
    count = turn_count
    if count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def position_indexer(player="X")
    position_indexes = []
    @board.each_index do |i|
      if @board[i] == player
        position_indexes << i
      end
    end
    position_indexes
  end

  def won?
    xpos_index = position_indexer
    opos_index = position_indexer("O")

    WIN_COMBINATIONS.detect do |array|
      array.all? { |e| xpos_index.include?(e)} || array.all? { |e| opos_index.include?(e)}
    end
  end

  def full?
    @board.all? do |cell|
      cell == "X" || cell == "O"
    end
  end

  def draw?
    if full? && won? == nil
      true
    else
      false
    end
  end

  def over?
    if draw? || won?
      true
    else
      false
    end
  end

  def winner
    won_result = won?
    if won_result == nil
      nil
    else
      @board[won_result[0]]
    end
  end

  def play
    while over? == false
      turn
    end

    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
end

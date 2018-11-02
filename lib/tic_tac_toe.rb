class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9," ")
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

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
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

  def turn_count
    counter = 0
    @board.each do |space|
      if space == "X" || space == "O"
        counter += 1
      end
    end
    counter
  end
  #
  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end
  #
  def won?
    if @board.any?{ |space| space != " " }
      WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]

        if position_taken?(win_index_1)
          if position_1 == position_2 && position_1 == position_3
            return win_combination
          end
        end
      end
    end
    false
  end

  def full?
    @board.none?{|space| space == " "}
  end

  def draw?
    if full? && !won?
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
    if over?
      if won?
        win_combination = won?
        character = @board[win_combination[0]]
      else
        nil
      end
    end
  end

  def play
    until over?
      turn
    end
  
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
   end

end

class TicTacToe
  # WIN_COMBINATIONS a constant
  WIN_COMBINATIONS = [[0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0, 4, 8],[2, 4, 6]]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_number = turn_count + 1
    turn_number.odd? ? current_player = "X" : current_player =  "O"
    return current_player
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end

  def full?
    @board.each do |position|
      if position != "X" && position != "O"
        return false
      end
    end
    return true
  end

  def input_to_index(gets)
    index = gets.to_i - 1
  end

  def move(index, value)
    @board[index] = value
  end

  def over?
    if won? || draw? || full?
      return true
    else
      return false
    end
  end

  def play
    while !over?
      turn
    end

    if draw?
      puts "Cat's Game!"
    end

    if won?
      puts "Congratulations #{winner}!"
    end
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)

    while valid_move?(index) == false
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
    end

    player=  current_player
    move(index, player)
    display_board
  end


  #def turn_count
    #turn_count = 0
    #@board.each do |turn|
      #if turn == "X" || turn == "O"
        #turn_count += 1
      #end
    #end
    #return turn_count
  #end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def winner
    winning_combination = won?
    if winning_combination
      return @board[winning_combination[0]]
    else
      return nil
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combination|

      if position_taken?(combination[0]) && position_taken?(combination[1]) && position_taken?(combination[2])
        position_1 = @board[combination[0]]
        position_2 = @board[combination[1]]
        position_3 = @board[combination[2]]

        if position_1 == position_2 && position_2 == position_3
          return combination
        end
      end
    end
    return false
  end


  def valid_move?(index)

    if index.between?(0, 8)
      if position_taken?(index) == false
        return true
      else
        return false
      end
    else
      return false
    end
  end
end

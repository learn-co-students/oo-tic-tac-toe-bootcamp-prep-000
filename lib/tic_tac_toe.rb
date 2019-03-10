class TicTacToe

  require "pry"

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

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts "\n"
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
    #puts "\nIt is #{current_player}'s turn" #does not allow to pass test due to arguments return 

    puts "\nPlease enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    # binding.pry
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    win_index_1 = ""
    win_index_2 = ""
    win_index_3 = ""
    pos_1 = ""
    pos_2 = ""
    pos_3 = ""
    win_combo_f = []
    WIN_COMBINATIONS.each do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]
      pos_1 = @board[win_index_1]
      pos_2 = @board[win_index_2]
      pos_3 = @board[win_index_3]
      # binding.pry
      if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
        return win_combo_f = win_combo
      elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
        return win_combo_f = win_combo
      else
        win_combo_f = false
      end
    end
    win_combo_f
  end

  def full?
    if @board.include?(" ") || @board.include?("") || @board.include?(nil)
      return false
    else
      return true
    end
  end

  def draw?
    if full? == true && won? == false
      return true
    else
      return false
    end
  end

  def over?
    if draw? == true
      return true
    elsif WIN_COMBINATIONS.include? (won?)
      return true
    else
      return false
    end
  end

  def winner
    if won? == false
      return nil
    else
      temp_a = won?
      if @board[temp_a[0]] == "X" &&   @board[temp_a[1]] == "X" && @board[temp_a[2]] == "X"
        return "X"
      elsif @board[temp_a[0]] == "O" && @board[temp_a[1]] == "O" && @board[temp_a[2]] == "O"
        return "O"
      end
    end
  end

  def play
    while over? == false && won? == false
      turn
    end
    if draw? == true
      puts "Cat's Game!"
    else
      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      end
    end
  end

end

class TicTacToe
  def initialize
    @board = Array.new(9, " ")
    display_board
  end
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # Left column
    [1,4,7],  # Middle column
    [2,5,8],  # Right row
    [0,4,8],  # First diagonal
    [2,4,6]  # Second diagonal
  ]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(index)
    @index = index
    @index = @index.to_i
    @index = @index - 1
  end

  def move(index, player = "X")
    @board[index] = player
  end

  def position_taken?
    if @board[@index] == "X" || @board[@index] == "O"
      true
    else
      if @board[@index] == "" || @board[@index] == " " || @board[@index] == nil
        false
      end
    end
  end

  def valid_move?
    if position_taken?
      false
    else
      if @index.between?(0, 8)
        true
      end
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    @index = input_to_index(input)
    if valid_move?
      move(@index, @player)
    else
      turn
    end
    display_board
  end

  def turn_count
    @counter = 0
    @board.each do |turn_number|
      if turn_number == "X" || turn_number =="O"
        @counter += 1
      end
    end
    @counter
  end

  def current_player
    turn_count
    @counter.even? ? @player = "X" : @player = "O"
  end

  def won?
    position = Array.new(3)
    if @board.all?{|i| i == "" || i == " "}
      false
    else WIN_COMBINATIONS.each do |win_combination|
        i=0
        while i <3
          position[i] = @board[win_combination[i]]
          i +=1
        end

        if position.all?{|value| value == "X"}
          return win_combination # return the win_combination indexes that won.
        else
          if position.all?{|value| value == "O"}
            return win_combination
          end
        end
      end
    end
    false
  end

  def full?
    if @board.all?{|i| i == "X" || i == "O"}
      true
    else
      false
    end
  end

  def draw?
    if !won?&& full?
      true
    else
      false
    end
  end

  def over?
    if draw? || full? || won? != false
      true
    else
      false
    end
  end

  def winner
    if won?== false
      nil
    else
      if @board[won?([0]] == "X"
        "X"
      else
        "O"
      end
    end

  end

  def play(
    while !over?
      turn
    end
    if won? != false
      puts "Congratulations #{winner(board)}!"
    else
      if draw?
        puts "Cats Game!"
      end
    end
  end







end

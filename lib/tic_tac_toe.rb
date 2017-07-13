class TicTacToe
 def initialize
   @board = Array.new(9, " ") # Creates an array with 9 elements filled with " "
 end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],
                      [0,3,6],[1,4,7],[2,5,8],
                      [0,4,8],[2,4,6]]

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

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
  num_turns = 0
   @board.each do |space|
     if space == "X" || space == "O"
       num_turns += 1
     end
   end
   num_turns
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end


  def won?
   win = false
   char_array = ["X","O"]

    WIN_COMBINATIONS.each do |win_index|
      char_array.each do |char|
        win = win_index.all? do |position|
          @board[position] == char
        end

          if win
          return win_index
        end
      end
    end

   win
  end

  def full?

    board_full = @board.all? do |cell|
      cell == "X" || cell == "O"
    end

  end

  def draw?

    if full? && !won?
      true
    end

  end

  def over?
    if draw? || won? || turn_count >= 9
      true
    end
  end


  def winner

    if won?
      @board[won?[0]]
    end

  end

  def play
    until over? do
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end

  end


end

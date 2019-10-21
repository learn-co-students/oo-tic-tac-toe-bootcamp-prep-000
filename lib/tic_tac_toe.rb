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

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

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

  def turn
      puts "Please enter 1-9:"
      display_board
      user_input = input_to_index(gets.strip)
      if valid_move?(user_input) == true
          move(user_input, current_player)
      else
        turn
      end
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def move(index, key)
    @board[index] = key
    def update_array_at_with(array, index, value)
      array[index] = value
    end
  end

  def turn_count
    counter = 0
      @board.each do |pos|
        if pos == "X" || pos == "O"
          counter += 1
        end
      end
      return counter
  end

  def won?
    win_combo = []
    WIN_COMBINATIONS.each do |win_combination|
      # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
      # grab each index from the win_combination that composes a win.
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3



        if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
          win_combo << win_combination
        elsif @board.all? { |e| e == " "  }
          return false
        end
    end
    return win_combo[0]
  end

  def position_taken?(index)
    if @board[index] === "X" || @board[index] === "O"
      return true
    else return false
    end
  end

  def valid_move?(index)
    valid = false
    within_range = false
    if index >= 0 && index <= 9
      within_range = true
    end
    if position_taken?(index) === false && within_range === true
      valid = true
    else valid = false
    end
    return valid
  end

  def full?
    !@board.include?(" ")
  end

  def draw?
    if !won? && full?
      true
    else false
    end
  end

  def over?
    if @board.include?(" ")
      false
    else true
    end
  end

  def winner
    if won?
      return @board[won?[0]]
    else nil
    end

  end

  def play
        counter = 0
        while counter <= 9 do
          counter += 1
        if won?
          puts "Congratulations #{winner}!"
          return
        elsif draw?
          puts "Cat's Game!"
          return
        elsif !over?
          turn
          end
      end
  end
end

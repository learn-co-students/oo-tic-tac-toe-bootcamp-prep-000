class TicTacToe
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
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
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

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      xCounter = 0
      oCounter = 0
      combination.each do |index|
        if @board[index] == "X"
          xCounter +=1
        elsif @board[index] == "O"
          oCounter +=1
        end
        if (xCounter == 3) || (oCounter == 3)
          return combination
        end
      end
    end
    false
  end

  def full?
    @board.none?{|index| index == " " || index == nil}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    index = won?
    if !won?
      nil
    elsif @board[index[0]] == 'X' && @board[index[1]] == 'X' && @board[index[2]] == 'X'
      'X'
    else
      'O'
    end
  end

    def turn
      #puts "Player #{current_player()} please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
        turn
      end
    end

    def input_to_index(user_input)
      user_input.to_i - 1
    end

    def move(index, current_player)
      @board[index] = current_player
    end

    def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
    end

    def play
      until over? do
        turn
      end
      if won?
      puts  "Congratulations #{winner}!"
      else
      puts  "Cat's Game!"
      end
    end

end

class TicTacToe

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]

  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i(10) - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count()
    @board.length - @board.count{|slot| slot == " "}
  end

  def current_player()
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def turn()
    puts "Please enter 1-9:"
    user_input  = gets.strip
    user_index = input_to_index(user_input)
    if valid_move?(user_index)
      move(user_index, current_player())
      display_board()
    else
      turn()
    end
  end

  def won?()
    winning_move = nil
    WIN_COMBINATIONS.each do | combo |
      first_position = combo[0]
      second_position = combo[1]
      third_position = combo[2]

      first_mark = @board[first_position]
      second_mark = @board[second_position]
      third_mark = @board[third_position]
      if (first_mark == second_mark) && (first_mark == third_mark) && position_taken?(first_position)
        winning_move = combo
      end
    end
  winning_move
  end

  def full?()
    !@board.any?{|i| i == " "}
  end

  def draw?()
    full?() && !won?()
  end

  def over?()
    draw?() || won?()
  end

  def winner()
    winning_move = won?()
    if (winning_move)
      @board[winning_move[0]]
    else
      winning_move
    end
  end

  def play()
    while !over?() do
      turn()
    end
    if won?()
      puts "Congratulations #{winner()}!"
    else
      puts "Cat's Game!"
    end
  end
end


#new_game.play()

class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,3,6]
  ]
  def initialize
    @board = Array.new(9, " ")
  end
  def play
    until over?
      turn
    end
    if(won?)
      game_winner = winner;
      puts "Congratulations " + game_winner+"!"
    elsif(draw?)
      puts "Cats Game!"
    end
  end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(input)
    input.to_i - 1
  end
  def move(input, current_player)
    index = input_to_index(input)
    @board[index] = current_player
  end
  def position_taken?(location)
    if (@board[location] == " ")
      false
    else
      true
    end
  end
  def valid_move?(input)
    index = input_to_index(input)
    index.between?(0,8) && !position_taken?(index)
  end
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input,current_player)
      display_board
    else
      turn
    end
  end
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  def won?
    wins = []
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]


      if position_1 === "X" && position_2 === "X" && position_3 === "X"
        wins << [win_index_1,win_index_2,win_index_3]
      end

      if position_1 === "O" && position_2 === "O" && position_3 === "O"
        wins << [win_index_1,win_index_2,win_index_3]
      end
    end

    if wins.length == 0
      return false
    else
      return wins[0]
    end
  end
  def full?
    @board.all? do |pos|
      pos == 'X' || pos =='O'
    end
  end
  def draw?
    game_full = full?
    game_won = won?
    if(game_full == true && game_won == false)
     return true
   end
   return false
  end
  def over?
    if(won? || draw? || full?)
      return true
    end
     return false
  end
  def winner
    if(won?)
      index = won?[0]
      winner = @board[index][0]
      return winner
    end
  end
end

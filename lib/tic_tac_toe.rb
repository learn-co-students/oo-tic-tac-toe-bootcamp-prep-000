class TicTacToe
 
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  ]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display_board(board_array = [])
    e = 0
    3.times do |i|
      board_array << " #{@board[e]} | #{@board[e+1]} | #{@board[e+2]} "
        if i/2 == 0
          board_array << "-----------\n"
        end
      e += 3  
      end
    board_array.each do |x|
      puts x
    end
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(board_index, character)
    @board[board_index] = character
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    if index > @board.length || index < 0
      false
    else
      !position_taken?(index)
    end
  end

  def turn_count
    count = 0
    @board.each do |position|
      if position == 'X' || position == 'O'
        count += 1
      end
    end
    return count
  end

  def current_player
    turns = turn_count
    turns.even? ? "X" : "O"
  end

  def turn
    puts 'Please enter 1-9:'
    input = input_to_index gets.strip
    if valid_move? input
      move(input, current_player)
      display_board
    else
      puts "invalid"
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.find do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end
  
  def full?
    !@board.include?(" ")
  end

  def draw?
    full? && !won?
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    if winner = won?
      @board[winner[0]]
    end
  end
  
  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
end
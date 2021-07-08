class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]
  ]
  
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
  
  def move(index, piece)
    @board[index] = piece
  end
  
  def position_taken?(index)
    @board[index] == " " || @board[index] == "" || @board[index] == nil ? false : true 
  end
  
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index) ? true : false
  end
  
  def turn_count
    counter = 0 
    @board.each do |piece|
      if piece == 'X' || piece == 'O'
        counter += 1 
      end
    end
    counter
  end
  
  def turn
    puts "Please enter 1-9:"
    position = gets.strip.chomp
    index = input_to_index(position)
    if valid_move?(index)
      piece = current_player
      move(index, piece)
      display_board
    else
      turn
    end
    true
  end
  
  def current_player
    (turn_count % 2).even? ? 'X' : 'O'
  end
  
  def won?
    for win_combination in WIN_COMBINATIONS do 
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      if (@board[win_index_1] == 'X' &&
          @board[win_index_2] == 'X' &&
          @board[win_index_3] == 'X') || 
          (@board[win_index_1] == 'O' &&
           @board[win_index_2] == 'O' &&
           @board[win_index_3] == 'O')
      return win_combination
    end
  end
  false
  end

  def full?
    @board.all? { |piece| piece == "X" || piece == "O" }
  end

  def draw?
    if full? && !won?
      true
    else
      false
    end
  end

  def over?
    full? || won? || draw? ? true : false
  end

  def winner
    won? ? @board[won?[0]] : nil
  end


  def play
    while !over?
      turn
    end
    
    if won?
      winning_row = won?
      puts "Congratulations #{winner}!"
    elsif draw?
        puts "Cat's Game!"
    end
  end
end
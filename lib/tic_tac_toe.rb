class TicTacToe
  def initialize
    @board = Array.new(9, " ")
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

  def display_board(board=@board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(move)
    move.to_i - 1
  end

  def move(index, player="X")
    @board[index] = player
  end

  def position_taken?(board=@board, index)
    board[index] == "X" || board[index] == "O"
  end

  def valid_move?(board=@board, index)
    index >= 0 && index <= 8 && !position_taken?(board, index)
  end

  def turn
    puts "Enter a value between 1-9: "
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      move(index, self.current_player)
      display_board()
    else
      while !valid_move?(index)
        puts "Enter a value between 1-9: "
        input = gets.chomp
        index = input_to_index(input)
      end
      move(index, self.current_player)
      display_board()
    end
  end

  def turn_count(board=@board)
    count = 0
    board.each {|e| count +=1 if e != " "}
    count
  end

  def current_player
    turn_count(@board) % 2 == 0 ? "X" : "O"
  end

  def won?(board=@board)
    WIN_COMBINATIONS.each do |combo|
      if board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]] &&\
         (board[combo[0]] == "X" || board[combo[0]] == "O")

        return combo
      end
    end
    false
  end

  def full?
    @board.include?(" ") == false
  end

  def draw?
    self.full? && !self.won?
  end

  def over?
    self.won? || self.draw?
  end

  def winner(board=@board)
    if self.won?
      combo = self.won?
      board[combo[0]]
    end
  end

  def play
    self.turn until self.over?

    if self.won?
      puts "Congratulations #{self.winner}!"
    else
      puts "Cat's Game!"
    end

  end

end

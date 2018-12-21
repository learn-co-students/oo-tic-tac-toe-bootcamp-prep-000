class TicTacToe
  attr_accessor :board
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
  def initialize()
    @board = [" "," "," "," "," "," "," "," "," "]

  end
  
  def display_board()
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  def input_to_index(input)
    return input.to_i - 1
  end
  
  def move(index, token)
    board[index] = token
    return board
  end
  
  def position_taken?(index)
    return board[index] != " "
  end
  
  def valid_move?(index)
    if !(0 <= index && index <= 8)
      return false
    end
    return !position_taken?(index)
  end
  
  def turn()
    puts("Enter a position 1-9")
    input = gets
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player())
      display_board()
    else
      turn()
    end
  end
  
  def turn_count()
    count = board.select{|i| i != " "}.length
    if count == nil
      return 0
    end
    return count
  end
  
  def current_player()
    if turn_count() % 2 == 0
      return "X"
    end 
    return "O"
  end
  
  def won?()
    WIN_COMBINATIONS.each do |combo|
      player_won = combo.all?{|i| board[i] == "X"}
      cpu_won = combo.all?{|i| board[i] == "O"}
      if cpu_won || player_won
        return combo
      end 
    end
    return nil
  end
  
  def full?()
    return board.none?{|i| i == " "}
  end
  
  def draw?()
    return full?() && !won?()
  end
  
  def over?()
    return draw?() || won?()
  end
  
  def winner()
    w = won?()
    if w != nil
      return board[w[0]]
    end
    return nil
  end  
  
  def play()
    until over?()
      turn() 
    end 
    winner = winner()
    if winner != nil
      puts("Congratulations #{winner}!")
    end
    if draw?()
      puts("Cat's Game!")
    end
  end
end

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

class TicTacToe
  def initialize()
    @board = Array.new(9, " ")
  end

  def display_row(row_number)
    row_start = 3 * row_number
    row = [
      @board[row_start],
      @board[row_start + 1],
      @board[row_start + 2]
    ]
    puts " #{row[0]} | #{row[1]} | #{row[2]} "
  end

  def display_board()
    separator = "-----------"
    
    display_row(0)
    puts(separator)
    display_row(1)
    puts(separator)
    display_row(2)
  end
  
  def input_to_index(input)
    input.strip.to_i - 1
  end

  def move(index, character)
    @board[index] = character
  end
  
  
  def valid_move?(index)
    return index.between?(0, 8) && !position_taken?(index)
  end
  
  def position_taken?(index)
    contents = @board[index]
    return (contents != " ") && (contents != "") && (contents != nil)
  end
  
  def turn_count()
    count = 0
    (0..8).each do |index|
      if(position_taken?(index))
        count += 1
      end
    end
    
    return count
  end
  
  def current_player()
    if(turn_count().even?)
      return "X"
    end
    return "O"
  end

  def turn()
    puts "Please enter 1-9:"
    input = gets.strip
    
    index = input_to_index(input)
    
    if(valid_move?(index))
      move(index, current_player())
      display_board()
    else
      turn()
    end
  end
  
  
  def won?()
    winning_positions = nil
  
    WIN_COMBINATIONS.each do |combination|
      c1 = combination[0]
      c2 = combination[1]
      c3 = combination[2]
      
      if(position_taken?(c1))
        b1 = @board[c1]
        b2 = @board[c2]
        b3 = @board[c3]
      
        row_symbol = b1
        if row_symbol == b2 && row_symbol == b3
          winning_positions = combination        
        end
      end
    end
    
    return winning_positions
  end
  
  def full?()
    (0..8).all? do |index|
      position_taken?(index)
    end
  end
  
  def draw?()
    return full?() && !won?()
  end
  
  def over?()
    return draw?() || won?()
  end
  
  
  def winner()
    winning_positions = won?()
    if(winning_positions)
      return @board[winning_positions[0]]
    else
      return nil
    end
  end
  
  def play()
    until over?() do
      turn()
    end
    if won?()
      symbol = winner()
      puts "Congratulations #{symbol}!"
    elsif draw?()
      puts "Cat's Game!"
    end
  end
end

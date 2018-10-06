class TicTacToe
  
  WIN_COMBINATIONS = [
  [ 0, 1, 2 ],
  [ 3, 4, 5 ],
  [ 6, 7, 8 ],
  [ 0, 4, 8 ],
  [ 2, 4, 6 ],
  [ 0, 3, 6 ],
  [ 1, 4, 7 ],
  [ 2, 5, 8 ]
  ]

  def initialize
    @board = [ " ", " ", " ", " ", " ", " ", " ", " ", " " ]
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    return (input.to_i - 1)
  end
  
  def move(position, token)
    @board[position] = token;
  end
  
  def position_taken?(index)
    return !(@board[index] == nil || @board[index] == " ");
  end
  
  def valid_move?(index)
    (!position_taken?(index) && index.between?(0, 8));
  end
  
  def current_player
    return turn_count%2 == 0 ? "X" : "O";
  end
  
  def turn_count
    count_array = @board.each_index.select do |index|
      position_taken?(index);
    end
    
    return count_array.length;
    
  end
  
  def turn
    input = gets.strip;
    token = current_player();
    index = input_to_index(input);
    if (valid_move?(index))
      move(index, token);
      display_board;
    else
      puts ("Invalid Move. Enter 1-9 for empty spot.");
      input = gets.strip;
    end
  end
  
  def draw?
    (full? && !won?)
  end
  
  def full?
    @board.each_index.all? do |index|
      position_taken?(index);
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |index_lst|
      if (
        index_lst.all? do |index|
          @board[index] == "X"
        end
        )
        return index_lst;
      elsif (
        index_lst.all? do |index|
          @board[index] == "O"
        end
        )
        return index_lst;
      end
    end
    return false;
  end
  
  def over?
    return (won? || draw?);
  end
  
  def winner
    if(won?)
      return @board[won?[0]]
    else
      return nil;
    end
  end
  
  def play
    until over?
      turn;
    end
    
    if (won?)
      puts "Congratulations #{winner}!";
    else
      puts "Cat's Game!";
    end
  end
  
end
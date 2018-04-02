class TicTacToe
  def initialize
    @board =  Array.new(9, " ");
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]];

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} ";
    puts "-----------";
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} ";
    puts "-----------";
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} ";
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1;
  end
  
  def move(index, current_player="X")
    @board[index] = current_player;
  end
  
  def position_taken?(input)
    if (input.class == String)
      return !(input.nil? || input == " " || input == "");
    else
      return !(@board[input].nil? || @board[input] == " " || @board[input] == "");
    end
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index);
  end
  
  def turn
    puts "Please enter 1-9:";
    input = gets.strip;
    index = input_to_index(input);
    if valid_move?(index)
      move(index, current_player);
      display_board;
    else
      turn;
    end
  end
  
  def turn_count
    return @board.count {|x| position_taken?(x)};
  end
  
  def current_player
    return turn_count.even? ? "X" : "O";
  end
  
  def won?
    winning_combo = nil;
    WIN_COMBINATIONS.any? do |combo|
      spot_arr = [@board[combo[0]], @board[combo[1]], @board[combo[2]]];
      if ((spot_arr.all? {|x| x == "X"}) || (spot_arr.all? {|x| x == "O"}))
        winning_combo = combo;
      end
    end
    return winning_combo;
  end
  
  def full?
    return @board.all? {|x| position_taken?(x)};
  end
  
  def draw?
    return full? && won?.nil?;
  end
  
  def over?
    return won? || draw? || full?;
  end
  
  def winner
    winning_combo = won?;
    return winning_combo.nil? ? nil : @board[winning_combo[0]];
  end
  
  def play
    until over? do
      turn;
    end
    
    if (won?)
      puts "Congratulations #{winner}!";
    elsif (draw?)
      puts "Cat's Game!";
    end
  end
end
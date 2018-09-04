class TicTacToe
  WIN_COMBINATIONS = (0...9).each_slice(3).to_a
  WIN_COMBINATIONS.concat WIN_COMBINATIONS[0].zip *WIN_COMBINATIONS[1..-1]
  WIN_COMBINATIONS << [0,4,8] << [6,4,2]

  def initialize(board = Array.new(9, " "))
    @board = board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n" \
         "-----------\n" \
         " #{@board[3]} | #{@board[4]} | #{@board[5]} \n" \
         "-----------\n" \
         " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def position_taken?(index)
    if @board[index].nil?
      false
    else
      @board[index].count('XO') > 0
    end
  end

  def move(index, token)
    @board[index] = token
  end

  def input_to_index(input)
   input.strip.to_i - 1
  end

  def turn
    spot = 0
    loop do
      puts "Please enter 1-9:"
      spot = input_to_index gets.chomp
      break if valid_move?(spot)
    end
    # http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-core/6745
    move(spot, current_player)
    display_board
  end

  def play
    loop do
      if over?
        break
      end
      turn
    end

    pl = winner
    phrases = {
      "X" => "Congratulations X!",
      "O" => "Congratulations O!",
      nil => "Cat's Game!"
    }

    puts phrases[pl]
  end

  def turn_count
    @board.join.count "XO"
  end

  def current_player
    "XO"[turn_count % 2]
  end

  def won?
    WIN_COMBINATIONS.find {|combo|
      ["XXX","OOO"].include? combo.map{|i| @board[i]}.join
    }
  end

  def full?
    @board.join.count("XO") == @board.size
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if !won?
      nil
    elsif @board.join.count("X") > @board.join.count("O")
      "X"
    else
      "O"
    end
  end

end

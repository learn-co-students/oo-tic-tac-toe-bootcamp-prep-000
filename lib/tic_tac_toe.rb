class TicTacToe
  def initialize
    @board = Array.new(9," ")
  end

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
  # Helper Methods
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  # Define your play method below
  def play
    until over?
      turn
    end

    if( won? )
      puts "Congratulations #{winner}!"
    elsif( draw? )
      puts "Cat's Game!"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move( index, current_player )
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each { |field| if( field == "X" || field == "O") then counter += 1 end }
      return counter
    end

    def current_player
      (turn_count % 2 == 0)? "X" : "O"
    end

    def position_taken?(index)
      !(@board[index].nil? || @board[index] == " ")
    end

    def won?
      candidates = []
      WIN_COMBINATIONS.each do |comb|
        if comb.all? { |el| position_taken?(el) }
          candidates << comb
        end
      end

      candidates.each do |candidate|
        if candidate.all? { |el| @board[el] == "X"}
          return candidate
        elsif candidate.all? { |e| @board[e] == "O" }
          return candidate
        end
      end
      return false
    end

    def full?
      if @board.all? { |e| (e != " " && e != "" && e != nil) }
        return true
      end
      return false
    end

    def draw?
      if( !won? && full? )
        return true
      end
      return false
    end

    def over?
      if( won? || draw? || full? )
        return true
      end
      return false
    end

    def winner
      won = won?
      if( won )
        return @board[won[0]]
      end
      return nil
    end
  end

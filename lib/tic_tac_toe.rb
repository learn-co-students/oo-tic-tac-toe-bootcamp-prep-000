class TicTacToe

  def initialize(board=nil)
      @board =board || Array.new(9, " ")
  end

WIN_COMBINATIONS=[
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
      input.to_i-1
    end

    def move(index, value="X")
      @board[index]=value
    end


    def position_taken?(index)
      if @board[index]==" " || @board[index]==nil || @board[index]==""
        false
      elsif @board[index]=="X" || @board[index]=="O"
        true
      end
    end

    def valid_move?(index)
      if position_taken?(index)
        false
      elsif index>=0 && index <=8
        true
      else
        false
      end
    end

    def turn_count
      counter=0
      @board.each do |b|
        if b=="X" || b=="O"
          counter+=1
        end
      end
      counter
    end

    def current_player
      turn_count%2==0 ? "X":"O"
    end


    def turn
      puts "Please enter 1-9:"
      input=gets.strip
      index=input_to_index(input)
      valid_move?(index) ? move(index, current_player): turn
      display_board
    end

    def won?
      combo=WIN_COMBINATIONS.detect do |win_combination|
        win_index_1=win_combination[0]
        win_index_2=win_combination[1]
        win_index_3=win_combination[2]

        position_1=@board[win_index_1]
        position_2=@board[win_index_2]
        position_3=@board[win_index_3]

         position_1 == position_2 && position_2 == position_3 && position_taken?(win_index_1)
      end
      combo.nil? ? false: combo
    end


    def full?
      @board.all? {|i| i=="X" || i=="O"}
    end

    def draw?
      !won?&& full? ? true: false
    end

    def over?
      won? || draw? || full? ? true: false
    end


    def winner
      a=won?
      if !a
        nil
      elsif @board[a[0]]=="X"
        "X"
      elsif @board[a[0]]=="O"
        "O"
      end
    end


    def play
      while !over?
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
    end
  end

end

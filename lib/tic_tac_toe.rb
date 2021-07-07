class TicTacToe
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],
                      [0,3,6],[1,4,7],[2,5,8],
                    [0,4,8],[2,4,6]]
  def initialize
    @board = [" "] * 9

  end

  def display_board
    b = []
    (0...@board.size-2).step(3) { |i|  b << @board[i..i+2].map {|letter| " #{letter} "}.join("|")}
    sep = "-" * b[0].size
    puts b.join("\n" + sep + "\n")
  end

  def input_to_index(id)
    id.to_i - 1
  end

  def move(index,player)
    @board[index] = player
  end

  def position_taken? index
    cell = @board[index]
    !(cell.nil? ||  cell.empty? || cell == " ")
  end

  def valid_move? index
    ((0...9).include? index) && ! position_taken?(index )
  end

  def turn_count
    count = 0
    @board.each.with_index { |cell,i| count+=1 if  position_taken?(i)}
   count
  end

  def current_player
     turn_count  % 2 == 0 ? "X" : "O"
  end


  def won?

    if (0..8).all? do |i|
      !position_taken? i
    end
    return false
  else

    id= 0

     while id < 8 do
       i,j,k = WIN_COMBINATIONS[id]

       if @board[i] == "X" && @board[j] == "X" && @board[k]== "X" ||
        @board[i] == "O" && @board[j] == "O" && @board[k]== "O"
        return   [i,j,k]
      end
      id+=1
    end
      return false
    end
  end



  def full?
    turn_count  == 9
  end

  def draw?
    full?  && !won?
  end

  def over?
    draw?  || won?
  end

  def winner
    index = won?
    if index
      @board[index[0]]
    end
  end






  def turn
    puts "Please enter 1-9:"
    index = input_to_index(gets.strip)
    until valid_move? index
      index = input_to_index(gets.strip)
    end
    player = current_player
    move(index,player)
    display_board
  end

  def winner
    index = won?
    if index
      @board[index[0]]
    end
  end

  def play

    while !over?
     turn

   end
   if  won?
     puts "Congratulations #{winner}!"
   else
     puts "Cat's Game!"
   end

  end


end

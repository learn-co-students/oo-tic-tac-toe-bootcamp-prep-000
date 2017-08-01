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

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end


  def won?
    count = 0
    while count < WIN_COMBINATIONS.length
      win_index_1 = WIN_COMBINATIONS[count][0];
      win_index_2 = WIN_COMBINATIONS[count][1];
      win_index_3 = WIN_COMBINATIONS[count][2];

      position_1 = @board[win_index_1];
      position_2 = @board[win_index_2];
      position_3 = @board[win_index_3];

      if (position_1 == 'X' && position_2 == 'X' && position_3 == 'X') || (position_1 == 'O' && position_2 == 'O' && position_3 == 'O')
        return WIN_COMBINATIONS[count]
      else
        false
      end
      count += 1
    end
  end

  def full?
    count = turn_count
    if count == 9
      return true
    else
      return false
    end
  end

  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end

  def over?
    if won?|| full? || draw?
      return true
    else
      return false
    end
  end

  def winner
    winner = won?
    if winner.is_a?(Array)
      return @board[winner[0]]
    else
      return winner
    end
  end

  def turn_count
    count = 0
    @board.each do |pos|
      if ((pos == "X") || (pos == "O"))
        count+=1
      end
    end
    return count
  end


  def current_player
    count = turn_count
    player = (count % 2 == 0)? 'X' : 'O'
  end

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


  def move(index, current_player="X")
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)

    if valid_move?(index)
        move(index, current_player)
        display_board
    else
      puts "That's not a valid move"
      turn
    end

  end

  # Define your play method below
  def play

    until over?
      turn
    end

    if won?
      champ = winner
      puts "Congratulations #{champ}!"
    elsif draw?
      puts "Cat\'s Game!"
    end

  end


end

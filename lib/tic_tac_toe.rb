  
class TicTacToe
    def initialize
      @board = Array.new(9, " ")
    end
    
    WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
    ]
    
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    def input_to_index(input)
      input.to_i - 1 
    end
    
    def move(i, token)
      @board[i] = token 
    end
    
    def position_taken?(i)
      !(@board[i].nil? || @board[i] == " " || @board[i] == "")
    end
    
    def valid_move?(i)
      i.between?(0, 8) && !position_taken?(i)
    end
    
    def turn_count
      @board.count{ |cell| cell == "X" || cell == "O" }
    end
    
    def current_player
      turn_count.even? ? "X" : "O"
    end
    
    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      player = current_player
      if valid_move?(index)
        move(index, player)
        display_board
      else 
        turn
      end
    end
    
    def won?
      WIN_COMBINATIONS.each do |combo|
        if position_taken?(combo[0]) && @board[combo[1]] == @board[combo[0]] && @board[combo[2]] == @board[combo[0]]
          return combo
        end
      end
      return false
    end
    
    def full?
      @board.all?{ |cell| cell == "X" || cell == "O" }
    end
  
    def draw?
      return full? && !won?
    end
   
    def over?
      return draw? || won?
    end
    
    def winner
      if win_combo = won?
        @board[win_combo.first]
      end
    end
    
    def play
      until over?
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      else
        puts "Something went wrong."
      end
    end
  end